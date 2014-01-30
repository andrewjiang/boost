class User < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :car
  has_many   :car_slots

  # Array of day names taken from Date::DAYNAMES. e.g. [ "Monday", "Wednesday", "Friday" ]
  serialize :default_car_schedule, JSON

  @@week_offset_to_day_name = {
    0 => "Monday",
    1 => "Tuesday",
    2 => "Wednesday",
    3 => "Thursday",
    4 => "Friday",
    5 => "Saturday",
    6 => "Sunday"
  }

  # Creates and saves car slots for the whole week that the given ref time falls under
  def create_default_car_slots(ref_time_for_week)
    days_in_schedule = Set.new(self.default_car_schedule)
    week_begin = ref_time_for_week.beginning_of_week
    for week_offset in 0..6
      d = week_begin.advance(:days => +week_offset)
      if days_in_schedule.include?(@@week_offset_to_day_name[week_offset])
        CarSlot.create(:user => self, :start_time => d, :end_time => d.end_of_day(), :status => CarSlot::RESERVED)
      else
        CarSlot.create(:user => self, :start_time => d, :end_time => d.end_of_day(), :status => CarSlot::UNASSIGNED)
      end
    end
  end

  def car_slots_ordered(start_time, num_slots)
    self.car_slots.where("start_time >= ? AND end_time <= ?", start_time, start_time.advance(:days => +num_slots)).order(:start_time)
  end
end
