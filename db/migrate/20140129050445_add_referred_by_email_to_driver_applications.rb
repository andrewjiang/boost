class AddReferredByEmailToDriverApplications < ActiveRecord::Migration
  def change
    add_column :driver_applications, :referred_by_email, :string
  end
end
