class AddResumeToDriverApplication < ActiveRecord::Migration
  def self.up
    add_attachment :driver_applications, :resume
    add_attachment :driver_applications, :drivers_license
  end

  def self.down
    remove_attachment :driver_applications, :resume
    remove_attachment :driver_applications, :drivers_license
  end
end
