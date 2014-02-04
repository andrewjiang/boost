class AddUniqueIndexToCarSlots < ActiveRecord::Migration
  def change
    add_index :car_slots, [:user_id, :start_time, :end_time], unique: true
  end
end
