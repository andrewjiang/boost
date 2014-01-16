class CarListingMailer < ActionMailer::Base
  default from: 'support@zephyrcar.com'

  def confirmation_email(car_listing)
    @car_listing = car_listing
    mail(to: @car_listing.email, subject: 'Request Received')
  end
end
