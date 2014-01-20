class AddCarIdIndexToUser < ActiveRecord::Migration
  def change
    add_index :users, :car_id, :name => 'car_id_idx'
  end
end
