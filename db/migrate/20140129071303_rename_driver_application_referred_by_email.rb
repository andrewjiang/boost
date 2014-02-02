class RenameDriverApplicationReferredByEmail < ActiveRecord::Migration
  def change
    rename_column :driver_applications, :referred_by_email, :referral_code
  end
end
