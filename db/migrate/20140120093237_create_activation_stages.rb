class CreateActivationStages < ActiveRecord::Migration
  def change
    create_table :activation_stages do |t|
      t.boolean :car_received
      t.boolean :uber
      t.boolean :lyft
      t.boolean :sidecar
      t.string :partner_email
      t.string :schedule
      t.string :swaps
      t.integer :driver_application_id
    end
  end
end
