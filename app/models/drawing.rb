class Drawing < ActiveRecord::Base
  belongs_to :picture
  belongs_to :category

  mount_uploader :image, ImageUploader
  
  validates :picture_id, presence: true
end