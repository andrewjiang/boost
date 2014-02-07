class FeeMailer < ActionMailer::Base
  default from: 'support@zephyrcar.com'

  def daily_fees_report_email(recipients, ref_datetime)
    @driver_slots_for_day = CarSlot.driver_slots_for_day(ref_datetime)
    mail(to: recipients, subject: "Member Fee Report for #{ref_datetime.to_date.to_formatted_s(:long)}")
  end

  def fee_changed_email(recipients, updated_car_slot)
    @updated_car_slot = updated_car_slot
    mail(to: recipients, subject: "Fee Change for member #{updated_car_slot.user.full_name} (#{updated_car_slot.user.email})")
  end

end

