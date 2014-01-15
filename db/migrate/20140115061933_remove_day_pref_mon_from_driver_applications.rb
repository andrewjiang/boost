class RemoveDayPrefMonFromDriverApplications < ActiveRecord::Migration
  def change
    remove_column :driver_applications, :day_pref_mon, :boolean
  end
end
