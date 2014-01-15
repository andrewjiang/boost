require 'paperclip'

class DriverApplication < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :facebook_link, presence: true
  validates :phone_number, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :address, presence: true
  validates :zip_code, presence: true

  has_attached_file :resume
  validates_attachment_presence :resume
  validates_attachment_size :resume, :less_than => 4.megabytes,
                            :unless => Proc.new {|m| m[:resume].nil?}

  has_attached_file :drivers_license
  validates_attachment_presence :drivers_license
  validates_attachment_size :drivers_license, :less_than => 4.megabytes,
                            :unless => Proc.new {|m| m[:drivers_license].nil?}

  validates :drive_days_per_week, presence: true
  validates :parking_pref, presence: true
end
