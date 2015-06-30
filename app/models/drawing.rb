class Drawing < ActiveRecord::Base
  belongs_to :picture
  belongs_to :category
  belongs_to :user
  has_many :likes
  has_many :comments, -> { order("created_at DESC") }

  mount_uploader :image, ImageUploader

  scope :newest, -> { order("created_at DESC") }
  scope :oldest, -> { order("created_at ASC") }
end