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
end
