class MailPreview < MailView
  def driver_application_confirmation
    struct = Struct.new(:email, :first_name).new('tommy@gmail.com', 'Tommy')
    return DriverApplicationMailer.confirmation_email(struct)
  end

  def driver_application_next_steps
    struct = Struct.new(:email, :first_name).new('tommy@gmail.com', 'Tommy')
    return DriverApplicationMailer.next_steps_email(struct)
  end

  def car_listing_confirmation
    struct = Struct.new(:email, :first_name).new('tommy@gmail.com', 'Tommy')
    return CarListingMailer.confirmation_email(struct)
  end
end
