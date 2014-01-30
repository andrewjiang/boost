class ScheduleController < ApplicationController
    include ApplicationHelper
  before_action :require_signed_in

  @@num_slots_to_display = 14

  def show
    # Show 14 car slots for all of this week and next week

    d = DateTime.current.at_beginning_of_week
    @car_slots = current_user.car_slots_ordered(d, @@num_slots_to_display)
  end

end
