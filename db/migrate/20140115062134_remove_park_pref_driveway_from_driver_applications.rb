class RemoveParkPrefDrivewayFromDriverApplications < ActiveRecord::Migration
  def change
    remove_column :driver_applications, :park_pref_driveway, :boolean
  end
end
