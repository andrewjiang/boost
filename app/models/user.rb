class User < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :car
  has_many   :car_slots

  before_create :set_default_car_slot_fees_if_absent
  # Map of day name to fee per status. e.g. { "Monday" => {"reserved" => 50, "cancelled" => 20}, ...  }
  serialize :default_car_slot_fees, JSON

  # Array of day names taken from User::DAYNAMES. e.g. [ "Monday", "Wednesday", "Friday" ]
  serialize :default_car_schedule, JSON


  DAYNAMES = [ "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" ]

  WEEKDAY_FEES = { CarSlot::RESERVED => 50, CarSlot::CANCELLED => 20 }
  WEEKEND_FEES = { CarSlot::RESERVED => 75, CarSlot::CANCELLED => 20 }

  DEFAULT_FEES = {
    "Monday"    => WEEKDAY_FEES,
    "Tuesday"   => WEEKDAY_FEES,
    "Wednesday" => WEEKDAY_FEES,
    "Thursday"  => WEEKDAY_FEES,
    "Friday"    => WEEKDAY_FEES,
    "Saturday"  => WEEKEND_FEES,
    "Sunday"    => WEEKEND_FEES
  }

  # Creates and saves car slots for the whole week that the given ref time falls under
  def create_default_car_slots(ref_time_for_week)
    days_in_schedule = Set.new(self.default_car_schedule)
    week_begin = ref_time_for_week.beginning_of_week
    for week_offset in 0..6
      dayname = DAYNAMES[week_offset]
      d = week_begin.advance(:days => +week_offset)
      CarSlot.create(
        :user          => self,
        :start_time    => d,
        :end_time      => d.end_of_day(),
        :reserved_fee  => self.default_car_slot_fees[dayname][CarSlot::RESERVED],
        :cancelled_fee => self.default_car_slot_fees[dayname][CarSlot::CANCELLED],
        :status        => days_in_schedule.include?(dayname) ? CarSlot::RESERVED : CarSlot::UNASSIGNED
      )
    end
  end

  # Returns an array consisting of the first num_slots car slots for this user starting at the given start time
  def car_slots_ordered(start_time, num_slots)
    self.car_slots.where("start_time >= ? AND end_time <= ?", start_time, start_time.advance(:days => +num_slots)).order(:start_time)
    # TODO: handle case where num slots returned != num slots requested (probably means we forgot to create enough car slots)
  end

  # Returns the user's driving partner
  def partner
    partners = self.car.users - [self]
    partners.empty? ? nil : partners[0]
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def male?
    self.gender == "m"
  end

  private

    def set_default_car_slot_fees_if_absent
      if self.default_car_slot_fees.nil?
        self.default_car_slot_fees = DEFAULT_FEES
      end
    end
end
