class AddReservedAndCancelledFeesToCarSlots < ActiveRecord::Migration
  def change
    remove_column :car_slots, :fee
    add_column :car_slots, :reserved_fee, :decimal, :precision => 8, :scale => 2
    add_column :car_slots, :cancelled_fee, :decimal, :precision => 8, :scale => 2
  end
end
