class DriverApplication < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :facebook_link, presence: true
  validates :phone_number, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :address, presence: true
  validates :zip_code, presence: true
end
