class AddAttachmentCarPictureToCarListings < ActiveRecord::Migration
  def self.up
    change_table :car_listings do |t|
      t.attachment :car_picture
    end
  end

  def self.down
    drop_attached_file :car_listings, :car_picture
  end
end
