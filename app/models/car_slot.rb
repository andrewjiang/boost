class CarSlot < ActiveRecord::Base
  belongs_to :user

  def label
    "%s ($%05.2f)" % [ self.start_time.to_formatted_s(:car_slot), self.fee ]
  end

  # Returns whether the slot is locked, which means it cannot be changed for charging purposes
  def locked?
    self.start_time <= DateTime.current
  end
end