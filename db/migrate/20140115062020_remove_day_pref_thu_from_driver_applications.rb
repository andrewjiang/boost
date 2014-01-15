class RemoveDayPrefThuFromDriverApplications < ActiveRecord::Migration
  def change
    remove_column :driver_applications, :day_pref_thu, :boolean
  end
end
