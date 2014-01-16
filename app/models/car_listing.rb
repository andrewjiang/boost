require 'paperclip'

class CarListing < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :city, presence: true
  validates :year, presence: true
  validates :make, presence: true
  validates :model, presence: true
  validates :color, presence: true
  validates :mileage, presence: true
  validates :vin, presence: true
  validates :availability_date, presence: true
  validates :last_oil_change_date, presence: true
  validates :last_month_registered_date, presence: true
  validates :features, presence: true
  validates :referred_by, presence: true

  has_attached_file :car_picture
  validates_attachment_presence :car_picture
  validates_attachment_size :car_picture, :less_than => 4.megabytes,
                            :unless => Proc.new {|m| m[:car_picture].nil?}

end
