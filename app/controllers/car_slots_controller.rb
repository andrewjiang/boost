class CarSlotsController < ApplicationController

  def update
    params[:status] = params[:status] == 'reserved' ? 'cancelled' : 'reserved'
    render :toggle, locals: { :car_slot_params => params }
  end

end
