ActiveAdmin.register Car do
  menu :priority => 2

  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    selectable_column
    column do |resource|
      link_to(I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link", :target => "_blank")
    end
    column "ID" do |resource|
      link_to resource.id, resource_path(resource), :class => "resource_id_link", :target => "_blank"
    end
    column "Car" do |resource|
      resource.name
    end
    column :vin
    column :license_number
    column "Assigned Members" do |resource|
      user_links = []
      resource.users.each do |user|
        user_links.push(link_to(user.full_name, admin_zephyr_member_path(user), :target => "_blank"))
      end
      user_links.join("<br />").html_safe
    end
  end

  show do |car|
    attributes_table do
      row :make
      row :model
      row :color
      row :year
      row :vin
      row :license_number
      row :assigned_members do
        user_links = []
        resource.users.each do |user|
          user_links.push(link_to(user.full_name, admin_zephyr_member_path(user), :target => "_blank"))
        end
        user_links.join("<br />").html_safe
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :make
      f.input :model
      f.input :color
      f.input :year
      f.input :vin
      f.input :license_number
      f.actions
    end
  end

end
