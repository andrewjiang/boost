class Car < ActiveRecord::Base
  has_many :users
  accepts_nested_attributes_for :users # needed for formtastic, used by active admin

  def name
    "#{self.year} #{self.make} #{self.model}" + (self.color.blank? ? "" : ", #{self.color}")
  end

  def create_default_car_slots(ref_time_for_week)
    self.users.each do |user|
      user.create_default_car_slots(ref_time_for_week)
    end
  end

end
