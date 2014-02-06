class FeeMailer < ActionMailer::Base
  default from: 'support@zephyrcar.com'

  def daily_fees_report_email
    @driver_slots_for_day = CarSlot.driver_slots_for_day
    mail(to: ['core@zephyrcar.com', 'support@zephyrcar.com'], subject: "Member Fee Report for #{Date.current.to_formatted_s(:long)}")
  end

end

