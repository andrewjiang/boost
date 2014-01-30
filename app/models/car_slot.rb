class CarSlot < ActiveRecord::Base

  belongs_to :user
  before_save :update_fee

  # Status types for a car slot
  RESERVED   = "reserved"   # The slot is reserved under the user
  CANCELLED  = "cancelled"  # The slot has been cancelled by the user
  UNASSIGNED = "unassigned" # The slot does not belong to the user

  # For now, just use static mapping of status to fees.
  # TODO: once we support special pricings (e.g. discounts or referral bonuses), we're gonna need to do something more sophisticated
  @@status_to_fee = { RESERVED => 50, CANCELLED => 20, UNASSIGNED => 0 }

  # Returns a formatted time identifier for the car slot 
  def time_label
    self.start_time.to_formatted_s(:car_slot)
  end

  # Returns the formatted fee 
  def fee_label
    if self.fee == 0
      "$0"
    else
      "$%05.2f" % self.fee
    end
  end

  # Returns whether the slot is locked, which means it cannot be changed for charging purposes
  def locked?
    self.start_time <= DateTime.current
  end

  def toggle_status!
    new_status = self.status == RESERVED ? CANCELLED : RESERVED
    self.update(:status => new_status)
    self
  end

  private

    def update_fee
      self.fee = @@status_to_fee[self.status]
    end
end