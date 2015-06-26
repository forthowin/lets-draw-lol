class Comment < ActiveRecord::Base
  validates :user_id, presence: true
  validates :drawing_id, presence: true
  validates :body, presence: true

  belongs_to :user
  belongs_to :drawing
end