class AddDriverApplicationIdToApplicationStage < ActiveRecord::Migration
  def change
    add_column :application_stages, :driver_application_id, :integer
  end
end
