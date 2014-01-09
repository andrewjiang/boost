class CreateDriverApplications < ActiveRecord::Migration
  def change
    create_table :driver_applications do |t|
      t.string :first_name
      t.string :last_name
      t.string :facebook_link
      t.string :phone_number
      t.string :email
      t.string :address
      t.string :zip_code
      t.boolean :day_pref_sun
      t.boolean :day_pref_mon
      t.boolean :day_pref_tue
      t.boolean :day_pref_wed
      t.boolean :day_pref_thu
      t.boolean :day_pref_fri
      t.boolean :day_pref_sat
      t.boolean :park_pref_garage
      t.boolean :park_pref_driveway
      t.boolean :park_pref_street

      t.timestamps
    end
  end
end
