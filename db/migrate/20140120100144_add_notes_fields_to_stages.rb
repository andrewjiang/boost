class AddNotesFieldsToStages < ActiveRecord::Migration
  def change
    add_column :application_stages, :notes, :string
    add_column :phone_screen_stages, :notes, :string
    add_column :onboarding_stages, :notes, :string
    add_column :activation_stages, :notes, :string
  end
end
