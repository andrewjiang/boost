class RemoveDayPrefFriFromDriverApplications < ActiveRecord::Migration
  def change
    remove_column :driver_applications, :day_pref_fri, :boolean
  end
end
