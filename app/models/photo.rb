class Photo < ActiveRecord::Base
   mount_uploader :file, Uploader
   belongs_to :album
   belongs_to :user, through: :album
end
