ActiveAdmin.register DriverApplication do
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
      row :day_pref_sun
      row :day_pref_mon
      row :day_pref_tue
      row :day_pref_wed
      row :day_pref_thu
      row :day_pref_fri
      row :day_pref_sat
      row :park_pref_garage
      row :park_pref_driveway
      row :park_pref_street
      row :created_at
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
