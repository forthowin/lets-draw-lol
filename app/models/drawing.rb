class Drawing < ActiveRecord::Base
  belongs_to :picture
  belongs_to :category
  belongs_to :user

  mount_uploader :image, ImageUploader
end