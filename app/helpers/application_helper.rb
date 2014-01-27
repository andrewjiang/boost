module ApplicationHelper
  def require_signed_in
    unless user_signed_in?
      flash[:alert] = "Please sign in first."
      redirect_to new_user_session_path
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
