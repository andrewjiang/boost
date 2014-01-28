class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to schedule_path
    end
  end
end
