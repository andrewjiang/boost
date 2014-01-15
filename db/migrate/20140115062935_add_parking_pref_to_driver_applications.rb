class AddParkingPrefToDriverApplications < ActiveRecord::Migration
  def change
    add_column :driver_applications, :parking_pref, :string
  end
end
