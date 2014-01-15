class AddReferralEmailsToDriverApplications < ActiveRecord::Migration
  def change
    add_column :driver_applications, :referral_emails, :string
  end
end
