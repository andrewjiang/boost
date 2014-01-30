class AddDefaultCarScheduleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :default_car_schedule, :text
  end
end
