class CarSlot < ActiveRecord::Base

  belongs_to :user

  # Status types for a car slot
  RESERVED   = "reserved"   # The slot is reserved under the user
  CANCELLED  = "cancelled"  # The slot has been cancelled by the user
  UNASSIGNED = "unassigned" # The slot does not belong to the user

  @@days_before_locked = 1

  # Returns a formatted time identifier for the car slot
  def time_label
    self.start_time.to_formatted_s(:car_slot)
  end

  def fee
    case self.status
    when RESERVED
      self.reserved_fee
    when CANCELLED
      self.cancelled_fee
    else
      0
    end
  end

  # Returns the formatted fee
  def fee_label
    if self.fee == 0
      "$0"
    else
      "$%d" % self.fee
    end
  end

  # Returns whether the slot is locked, which means it cannot be changed for charging purposes
  def locked?
    DateTime.current.advance(:days => +@@days_before_locked) >= self.start_time
  end

  def toggle_status!
    new_status = self.status == RESERVED ? CANCELLED : RESERVED
    self.update(:status => new_status)
    self
  end

  def self.driver_slots_for_day(ref_datetime=DateTime.current)
    fee_per_driver = Hash.new
    CarSlot.where(start_time: ref_datetime.beginning_of_day).each do |c|
      fee_per_driver[c.user] = c
    end
    fee_per_driver
  end
end
