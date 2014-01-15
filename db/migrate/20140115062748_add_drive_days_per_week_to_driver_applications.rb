class AddDriveDaysPerWeekToDriverApplications < ActiveRecord::Migration
  def change
    add_column :driver_applications, :drive_days_per_week, :integer
  end
end
