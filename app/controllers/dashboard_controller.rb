class DashboardController < ApplicationController
    include ApplicationHelper

  def welcome
    if user_signed_in?
      redirect_to schedule_path
    end
  end

  def show

  end

end
