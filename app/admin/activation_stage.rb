ActiveAdmin.register ActivationStage do

  menu false

  controller do
    def permitted_params
      params.permit!
    end
  end

  show do |stage|
    attributes_table do
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

  form do |f|
    f.inputs do
      f.input :notes
      f.input :car_received
      f.input :uber
      f.input :lyft
      f.input :sidecar
      f.input :partner_email
      f.input :schedule
      f.input :swaps
      f.actions
    end
  end

end

