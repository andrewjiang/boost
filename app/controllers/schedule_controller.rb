class ScheduleController < ApplicationController
    include ApplicationHelper
  before_action :require_signed_in

  def show
    @car_slots = [ {:id => 0, :name => "Monday", :status => "reserved"}, {:id => 1, :name => "Tuesday", :status => "cancelled"} ]
  end

end
