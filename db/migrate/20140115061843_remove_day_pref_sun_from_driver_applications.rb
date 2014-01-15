class RemoveDayPrefSunFromDriverApplications < ActiveRecord::Migration
  def change
    remove_column :driver_applications, :day_pref_sun, :boolean
  end
end
