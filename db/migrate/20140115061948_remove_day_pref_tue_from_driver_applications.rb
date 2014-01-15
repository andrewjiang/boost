class RemoveDayPrefTueFromDriverApplications < ActiveRecord::Migration
  def change
    remove_column :driver_applications, :day_pref_tue, :boolean
  end
end
