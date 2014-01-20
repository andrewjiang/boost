ActiveAdmin.register ApplicationStage do

  menu false

  controller do
    def permitted_params
      params.permit!
    end
  end

  show do |stage|
    attributes_table do
      exclude_unnecessary_fields(ApplicationStage.column_names).each do |f|
        row f.to_sym
      end
    end
    active_admin_comments
  end

end
