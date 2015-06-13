class Drawing < ActiveRecord::Base
  belongs_to :picture

  mount_uploader :image, ImageUploader
  
  validates :picture_id, presence: true
end