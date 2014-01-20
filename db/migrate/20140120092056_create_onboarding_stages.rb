class CreateOnboardingStages < ActiveRecord::Migration
  def change
    create_table :onboarding_stages do |t|
      t.boolean :signed
      t.boolean :email_forwarding
      t.boolean :referral_email
      t.integer :driver_application_id
    end
  end
end
