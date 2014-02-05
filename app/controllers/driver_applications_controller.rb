class DriverApplicationsController < ApplicationController
  def new
    @driver_application = DriverApplication.new
  end

  def create
    @driver_application = DriverApplication.new(driver_application_params)
    if @driver_application.save
      DriverApplicationMailer.confirmation_email(@driver_application).deliver
      redirect_to drive_submitted_path
    else
      render 'new'
    end
  end

  def destroy
  end

  def submitted
  end

  private

    def driver_application_params
      application_params = params.require(:driver_application).permit(
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
          :referred_by,
          :referral_code,
          :referral_email_0,
          :referral_email_1,
          :referral_email_2,
          :is_partner_0,
          :is_partner_1,
          :is_partner_2)
      # Combine the referral_email_* and is_partner_* params to form the referral_emails and partner_emails column values
      partner_emails = []
      if application_params[:is_partner_0] == "1"
        partner_emails.append(application_params[:referral_email_0])
      end
      if application_params[:is_partner_1] == "1"
        partner_emails.append(application_params[:referral_email_1])
      end
      if application_params[:is_partner_2] == "1"
        partner_emails.append(application_params[:referral_email_2])
      end

      application_params[:partner_emails] = partner_emails.reject(&:blank?).join(', ')
      application_params[:referral_emails] = [  application_params[:referral_email_0],
                                                application_params[:referral_email_1],
                                                application_params[:referral_email_2] ]
                                                .reject(&:blank?).join(', ')


      [:referral_email_0, :referral_email_1, :referral_email_2, :is_partner_0, :is_partner_1, :is_partner_2].each { |k| application_params.delete k }
      return application_params
    end
end
