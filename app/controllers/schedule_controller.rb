class ScheduleController < ApplicationController
    include ApplicationHelper
  before_action :require_signed_in

  @@num_slots_to_display = 14

  def show
    # Show 14 car slots for all of this week and next week

    d = DateTime.current.at_beginning_of_week
    car_slots_for_current_user = current_user.car_slots.where("start_time >= ? AND end_time <= ?", d, d.advance(:days => +@@num_slots_to_display))
    puts current_user.car_slots
    car_slots_by_time_label = Hash[car_slots_for_current_user.collect { |car_slot|
      [car_slot.time_label, car_slot]
    }]

    puts car_slots_by_time_label

    @car_slots = []
    for i in 1..@@num_slots_to_display
      time_label = CarSlot.time_label(d)
      if car_slots_by_time_label.include?(time_label)
        car_slot = car_slots_by_time_label[time_label]
        @car_slots.push( car_slot )
      else
        # Be careful to never save this record to the db. Once we support swapping slots, we'll be using actual car slot db records.
        @car_slots.push( CarSlot.new(:id => -1, :start_time => d, :status => 'unassigned', :fee => 0) )
      end
      d = d.advance(:days => +1)
    end
  end

end
