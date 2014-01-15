class RemoveParkPrefGarageFromDriverApplications < ActiveRecord::Migration
  def change
    remove_column :driver_applications, :park_pref_garage, :boolean
  end
end
