ActiveAdmin.register DriverApplication do
  controller do
    def permitted_params
      params.permit!
    end
  end

#  index do
#    cols_to_exclude = ["created_at", "updated_at"]
#    (ApplicationStage.column_names - cols_to_exclude).each do |c|
#      column c.to_sym
#    end
#  end

  show do |driver_application|
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
        rows  :phone_screen_status, :quiz_score, :facebook_like, :meets_hard_requirements, :notes
      end
    end
    panel "Phone Screen Stage" do
      stage = driver_application.phone_screen_stage
      div do
        link_to 'Edit', "/admin/phone_screen_stages/#{stage.id}/edit", :class => "resource_id_link", :target => "_blank"
      end

      attributes_table_for(stage) do
        rows :fit_score, :pass, :reason_if_fail, :clean_driving_record, :commitments, :max_availability, :num_partners, :reservation_fee, :forms_sent, :scheduling_email, :notes
      end
    end
    panel "Onboarding Stage" do
      stage = driver_application.onboarding_stage
      div do
        link_to 'Edit', "/admin/onboarding_stages/#{stage.id}/edit", :class => "resource_id_link", :target => "_blank"
      end

      attributes_table_for(stage) do
        rows :signed, :email_forwarding, :referral_email, :notes
      end
    end
    panel "Activation Stage" do
      stage = driver_application.activation_stage
      div do
        link_to 'Edit', "/admin/activation_stages/#{stage.id}/edit", :class => "resource_id_link", :target => "_blank"
      end

      attributes_table_for(stage) do
        rows :car_received, :uber, :lyft, :sidecar, :partner_email, :schedule, :swaps, :notes
      end
    end

    active_admin_comments
  end
end
