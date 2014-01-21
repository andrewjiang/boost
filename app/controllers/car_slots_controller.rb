class CarSlotsController < ApplicationController

  def update
    render :toggle, locals: { :car_slot => CarSlot.find(params[:id]).toggle_status!, :idx => params[:idx] }
  end

end
