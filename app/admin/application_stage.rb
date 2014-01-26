ActiveAdmin.register ApplicationStage do

  menu false

  controller do
    def permitted_params
      params.permit!
    end
  end

  show do |stage|
    attributes_table do
      row :notes
      row :phone_screen_status
      row :meets_hard_requirements
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :notes
      f.input :phone_screen_status
      f.input :meets_hard_requirements
      f.actions
    end
  end

end
