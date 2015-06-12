class Picture < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true
  validates :image, presence: true
  validates :category_id, presence: true
end