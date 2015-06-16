class Category < ActiveRecord::Base
  has_many :pictures
  has_many :drawings

  validates :name, presence: true
end