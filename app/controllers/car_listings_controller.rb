class CarListingsController < ApplicationController
  def new
    @car_listing = CarListing.new
  end

  def create
    @car_listing = CarListing.new(car_listing_params)
    if @car_listing.save
      CarListingMailer.confirmation_email(@car_listing).deliver
      redirect_to list_submitted_path
    else
      render 'new'
    end
  end

  def destroy
  end

  def submitted
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
