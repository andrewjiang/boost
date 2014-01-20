class CreatePhoneScreenStages < ActiveRecord::Migration
  def change
    create_table :phone_screen_stages do |t|
      t.integer :fit_score
      t.boolean :pass
      t.string :reason_if_fail
      t.boolean :clean_driving_record
      t.string :commitments
      t.string :max_availability
      t.integer :num_partners
      t.boolean :reservation_fee
      t.boolean :forms_sent
      t.boolean :scheduling_email
      t.integer :driver_application_id
    end
  end
end
