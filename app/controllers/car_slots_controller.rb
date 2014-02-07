class CarSlotsController < ApplicationController

  def update
    updated_car_slot = CarSlot.find(params[:id])
    render :toggle, locals: { :car_slot => updated_car_slot.toggle_status!, :idx => params[:idx] }
    FeeMailer.fee_changed_email('support@zephyrcar.com', updated_car_slot).deliver
  end

end
