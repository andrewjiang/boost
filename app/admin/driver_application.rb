ActiveAdmin.register DriverApplication do
  controller do
    def permitted_params
      params.permit!
    end
  end

  show do |driver_application|
    @driver_application = driver_application
    render 'stage_select'

    attributes_table do
      row :created_at
      row :first_name
      row :last_name
      row :facebook_link
      row :phone_number
      row :email
      row :address
      row :zip_code
      row :drive_days_per_week
      row :parking_pref
      row :referred_by
      row :referral_emails
      row :partner_emails
      row :resume do
        link_to driver_application.resume_file_name, driver_application.resume.url
      end
      row :drivers_license do
        link_to driver_application.drivers_license_file_name, driver_application.drivers_license.url
      end
    end

    panel "Application Stage" do
      stage = driver_application.application_stage
      div do
        link_to 'Edit', "/admin/application_stages/#{stage.id}/edit", :class => "resource_id_link", :target => "_blank"
      end

      attributes_table_for(stage) do
        row :notes
        row :phone_screen_status
        row :meets_hard_requirements
      end
    end

    panel "Phone Screen Stage" do
      stage = driver_application.phone_screen_stage
      div do
        link_to 'Edit', "/admin/phone_screen_stages/#{stage.id}/edit", :class => "resource_id_link", :target => "_blank"
      end

      attributes_table_for(stage) do
        row :notes
        row :fit_score
        row 'Pass?' do
          stage.pass
        end
        row :reason_if_fail
        row :clean_driving_record
        row :commitments
        row :max_availability
        row :num_partners
        row :reservation_fee
        row 'Payment Type: options are "credit card", "debit card", "paypal"' do
          stage.payment_type
        end
        row :scheduling_email
      end
    end

    panel "Onboarding Stage" do
      stage = driver_application.onboarding_stage
      div do
        link_to 'Edit', "/admin/onboarding_stages/#{stage.id}/edit", :class => "resource_id_link", :target => "_blank"
      end

      attributes_table_for(stage) do
        row :notes
        row :signed
        row :email_forwarding
        row :referral_email
      end
    end

    panel "Activation Stage" do
      stage = driver_application.activation_stage
      div do
        link_to 'Edit', "/admin/activation_stages/#{stage.id}/edit", :class => "resource_id_link", :target => "_blank"
      end

      attributes_table_for(stage) do
        row :notes
        row :car_received
        row :uber
        row :lyft
        row :sidecar
        row :partner_email
        row :schedule
        row :swaps
      end
    end

    active_admin_comments
  end
end
