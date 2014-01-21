class AddFeeToCarSlots < ActiveRecord::Migration
  def change
    add_column :car_slots, :fee, :decimal, :precision => 8, :scale => 2
  end
end
