class AddPartnerEmailsToDriverApplications < ActiveRecord::Migration
  def change
    add_column :driver_applications, :partner_emails, :string
  end
end
