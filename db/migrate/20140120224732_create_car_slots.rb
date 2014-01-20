class CreateCarSlots < ActiveRecord::Migration
  def change
    create_table :car_slots do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id
      t.string :status
    end

    add_index :car_slots, :user_id, name: "user_idx"
  end
end
