class DriverApplicationMailer < ActionMailer::Base

  def confirmation_email(driver_application)
    @driver_application = driver_application
    mail(to: @driver_application.email, subject: 'Application Received')
  end
end
