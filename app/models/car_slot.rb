class CarSlot < ActiveRecord::Base

  # For now, just use static mapping of status to fees.
  # TODO: once we support special pricings (e.g. discounts or referral bonuses), we're gonna need to do something more sophisticated
  @@status_to_fee = { 'reserved' => 50, 'cancelled' => 20, 'unassigned' => 0 }

  belongs_to :user

  def label
    if self.fee == 0
      "%s ($0)" % self.start_time.to_formatted_s(:car_slot)
    else
      "%s ($%05.2f)" % [ self.start_time.to_formatted_s(:car_slot), self.fee ]
    end
  end

  # Returns whether the slot is locked, which means it cannot be changed for charging purposes
  def locked?
    self.start_time <= DateTime.current
  end

  def toggle_status!
    new_status = self.status == 'reserved' ? 'cancelled' : 'reserved'
    self.update(:status => new_status, :fee => @@status_to_fee[new_status])
    self
  end
end