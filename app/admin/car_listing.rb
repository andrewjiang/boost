ActiveAdmin.register CarListing do
  controller do
    def permitted_params
      params.permit!
    end
  end

  show do |car_listing|
    attributes_table do
      row :id
      row :created_at
      row :updated_at
      row :first_name
      row :last_name
      row :phone_number
      row :email
      row :city
      row :year
      row :make
      row :model
      row :color
      row :mileage
      row :vin
      row :availability_date
      row :last_oil_change_date
      row :last_month_registered_date
      row :issues
      row :features
      row :referred_by
      row :car_picture do
        link_to car_listing.car_picture_file_name, car_listing.car_picture.url
      end
    end
    active_admin_comments
  end
end

