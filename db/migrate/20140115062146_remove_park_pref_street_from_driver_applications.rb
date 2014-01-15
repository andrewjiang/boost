class RemoveParkPrefStreetFromDriverApplications < ActiveRecord::Migration
  def change
    remove_column :driver_applications, :park_pref_street, :boolean
  end
end
