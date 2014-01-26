ActiveAdmin.register OnboardingStage do

  menu false

  controller do
    def permitted_params
      params.permit!
    end
  end

  show do |stage|
    attributes_table do
      row :notes
      row :signed
      row :email_forwarding
      row :referral_email
    end
  end

  form do |f|
    f.inputs do
      f.input :notes
      f.input :signed
      f.input :email_forwarding
      f.input :referral_email
      f.actions
    end
  end

end

