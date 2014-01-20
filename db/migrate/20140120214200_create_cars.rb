class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :color
      t.integer :year
      t.string :vin
      t.string :license_number
    end
  end
end
