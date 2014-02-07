ActiveAdmin.register User do

  controller do
    def permitted_params
      params.permit!
    end
  end

  batch_action :reset_passwords do |selection|
    User.find(selection).each do |user|
      user.send_reset_password_instructions
    end
    redirect_to :back
  end

  index do
    selectable_column
    column do |resource|
      link_to(I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link", :target => "_blank")
    end
    column :name do |resource|
      resource.full_name
    end
    column :default_car_schedule do |resource|
      resource.default_car_schedule.join(', ')
    end
    column :email
    column :phone_number
    column :address
    column :parking_instructions
    column :parking_timing
    column :how_to_contact
  end

  show do |user|
    attributes_table do
      row :first_name
      row :last_name
      row :default_car_schedule do
        user.default_car_schedule.join(', ')
      end
      row :email
      row :phone_number
      row :address
      row :parking_instructions
      row :parking_timing
      row :how_to_contact
    end
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :default_car_schedule, :as => :check_boxes, :collection => User::DAYNAMES
      f.input :email
      f.input :phone_number
      f.input :address
      f.input :parking_instructions
      f.input :parking_timing
      f.input :how_to_contact
      f.actions
    end
  end
end
