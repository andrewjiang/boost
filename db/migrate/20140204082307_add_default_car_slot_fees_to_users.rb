class AddDefaultCarSlotFeesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :default_car_slot_fees, :text
  end
end
