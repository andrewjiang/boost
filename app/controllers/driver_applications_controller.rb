class DriverApplicationsController < ApplicationController
  def new
    @driver_application = DriverApplication.new
  end

  def create
    @driver_application = DriverApplication.new(driver_application_params)
    if @driver_application.save
      flash[:success] = "Thanks for submitting your application! We will be contacting you shortly."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
  end

  private

    def driver_application_params
      params.require(:driver_application) .permit(
          :first_name,
          :last_name,
          :facebook_link,
          :phone_number,
          :email,
          :address,
          :zip_code,
          :day_pref_sun,
          :day_pref_mon,
          :day_pref_tue,
          :day_pref_wed,
          :day_pref_thu,
          :day_pref_fri,
          :day_pref_sat,
          :park_pref_garage,
          :park_pref_driveway,
          :park_pref_street)
    end
end
