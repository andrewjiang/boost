class CreateApplicationStages < ActiveRecord::Migration
  def change
    create_table :application_stages do |t|
      t.string :phone_screen_status
      t.integer :quiz_score
      t.boolean :facebook_like
      t.boolean :meets_hard_requirements

      t.timestamps
    end
  end
end
