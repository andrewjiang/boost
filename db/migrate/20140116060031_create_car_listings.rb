class CreateCarListings < ActiveRecord::Migration
  def change
    create_table :car_listings do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :city
      t.string :year
      t.string :make
      t.string :model
      t.string :color
      t.string :mileage
      t.string :vin
      t.string :availability_date
      t.string :last_oil_change_date
      t.string :last_month_registered_date
      t.string :issues
      t.string :features
      t.string :referred_by

      t.timestamps
    end
  end
end
