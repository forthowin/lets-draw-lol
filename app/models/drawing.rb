class Drawing < ActiveRecord::Base
  belongs_to :picture
  belongs_to :category
  belongs_to :user
  has_many :likes

  mount_uploader :image, ImageUploader
end