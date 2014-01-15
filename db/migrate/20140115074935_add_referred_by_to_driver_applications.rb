class AddReferredByToDriverApplications < ActiveRecord::Migration
  def change
    add_column :driver_applications, :referred_by, :string
  end
end
