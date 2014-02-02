class AddStageToDriverApplications < ActiveRecord::Migration
  def change
    add_column :driver_applications, :stage, :string
  end
end
