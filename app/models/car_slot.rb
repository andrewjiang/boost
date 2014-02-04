class CarSlot < ActiveRecord::Base

  belongs_to :user

  # Status types for a car slot
  RESERVED   = "reserved"   # The slot is reserved under the user
  CANCELLED  = "cancelled"  # The slot has been cancelled by the user
  UNASSIGNED = "unassigned" # The slot does not belong to the user

  @@days_before_locked = 2

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
    DateTime.current + @@days_before_locked >= self.start_time
  end

  def toggle_status!
    new_status = self.status == RESERVED ? CANCELLED : RESERVED
    self.update(:status => new_status)
    self
  end
end
