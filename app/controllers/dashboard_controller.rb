class DashboardController < ApplicationController
  before_action :require_login

  def show

  end

  private

    def require_login
      unless user_signed_in?
        flash[:alert] = "Please sign in first."
        redirect_to new_user_session_path
      end
    end
end
