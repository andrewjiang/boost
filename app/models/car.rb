class Car < ActiveRecord::Base
  has_many :users

  def create_default_car_slots(ref_time_for_week)
    self.users.each do |user|
      user.create_default_car_slots(ref_time_for_week)
    end
  end

end
