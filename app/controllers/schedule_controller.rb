class ScheduleController < ApplicationController
    include ApplicationHelper
  before_action :require_signed_in

  def show
    # Show car slots for all 7 days of the current week
    d = DateTime.current.at_beginning_of_week
    car_slots_for_current_user = current_user.car_slots.where("start_time >= ? AND end_time <= ?", d, DateTime.current.at_end_of_week)
    car_slots_by_start_time = Hash[car_slots_for_current_user.collect { |car_slot|
      [car_slot.start_time.to_formatted_s(:car_slot), car_slot]
    }]

    @car_slots = []
    for i in 0..6
      d_formatted = d.to_formatted_s(:car_slot)
      if car_slots_by_start_time.include?(d_formatted)
        cur_slot = car_slots_by_start_time[d_formatted]
        @car_slots.push( { :id => cur_slot.id, :name => d_formatted, :status => cur_slot.status } )
      else
        @car_slots.push( { :id => -1, :name => d_formatted, :status => 'unassigned'} )
      end
      d = d.advance(:days => +1)
    end
  end

end
