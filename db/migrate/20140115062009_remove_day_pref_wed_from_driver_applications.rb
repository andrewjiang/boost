class RemoveDayPrefWedFromDriverApplications < ActiveRecord::Migration
  def change
    remove_column :driver_applications, :day_pref_wed, :boolean
  end
end
