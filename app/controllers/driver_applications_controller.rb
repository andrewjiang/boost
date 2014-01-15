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
      params.require(:driver_application).permit(
          :first_name,
          :last_name,
          :facebook_link,
          :phone_number,
          :email,
          :address,
          :zip_code,
          :drive_days_per_week,
          :parking_pref,
          :resume,
          :drivers_license,
          :referred_by)
    end
end
