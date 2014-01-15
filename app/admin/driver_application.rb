ActiveAdmin.register DriverApplication do
  controller do
    def permitted_params
      params.permit!
    end
  end

  show do |driver_application|
    attributes_table do
      row :id
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
      row :updated_at
      row :resume do
        link_to driver_application.resume_file_name, driver_application.resume.url
      end
      row :drivers_license do
        link_to driver_application.drivers_license_file_name, driver_application.drivers_license.url
      end
    end
    active_admin_comments
  end
end
