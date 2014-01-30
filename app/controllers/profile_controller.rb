class ProfileController < ApplicationController
    include ApplicationHelper
  before_action :require_signed_in

  def show
    @partner = current_user.partner
  end

end
