class UpdateDriverFlowStages < ActiveRecord::Migration
  def change
    remove_column :application_stages, :quiz_score
    remove_column :application_stages, :facebook_like
    remove_column :phone_screen_stages, :forms_sent
    add_column :phone_screen_stages, :payment_type, :string
    add_column :phone_screen_stages, :applied_to_uber, :boolean
    add_column :phone_screen_stages, :applied_to_lyft, :boolean
  end
end
