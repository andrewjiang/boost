class CarListingsController < ApplicationController
  def new
    @car_listing = CarListing.new
  end

  def create
    @car_listing = CarListing.new(car_listing_params)
    if @car_listing.save
      CarListingMailer.confirmation_email(@car_listing).deliver
      flash[:"success alert alert-success ephemeral"] = "Thanks for listing your car! A Zephyr car specialist will reach out if there is a match"
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
