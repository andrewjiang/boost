module ApplicationHelper
  def require_signed_in
    unless user_signed_in?
      flash[:alert] = "Please sign in first."
      redirect_to new_user_session_path
    end
  end
end
