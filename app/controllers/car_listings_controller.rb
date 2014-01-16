class CarListingsController < ApplicationController
  def new
    @car_listing = CarListing.new
  end

  def create
    @car_listing = CarListing.new(car_listing_params)
    if @car_listing.save
      flash[:success] = "Thanks for listing your car! We will be contacting you shortly."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
  end

  private

    def car_listing_params
      params.require(:car_listing).permit(
          :first_name,
          :last_name,
          :phone_number,
          :email,
          :city,
          :year,
          :make,
          :model,
          :color,
          :mileage,
          :vin,
          :availability_date,
          :last_oil_change_date,
          :last_month_registered_date,
          :car_picture,
          :issues,
          :features,
          :referred_by)
    end

end
