class DriverApplicationMailer < ActionMailer::Base
  default from: 'support@zephyrcar.com'

  def confirmation_email(driver_application)
    @driver_application = driver_application
    mail(to: @driver_application.email, subject: 'Application Received')
  end

  def next_steps_email(driver_application)
    @driver_application = driver_application
    mail(to: @driver_application.email, subject: 'Thanks! Next Steps')
  end
end
