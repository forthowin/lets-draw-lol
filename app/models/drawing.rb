class Drawing < ActiveRecord::Base
  belongs_to :picture
  belongs_to :category

  mount_uploader :image, ImageUploader
end