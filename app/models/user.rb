class User < ActiveRecord::Base

  has_secure_password
  validates :email, uniqueness: true

  has_many :albums
  has_many :photos, through: :photos

  # mount_uploader :file, PhotoUploader
end
