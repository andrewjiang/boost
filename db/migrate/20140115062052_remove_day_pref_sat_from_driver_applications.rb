class RemoveDayPrefSatFromDriverApplications < ActiveRecord::Migration
  def change
    remove_column :driver_applications, :day_pref_sat, :boolean
  end
end
