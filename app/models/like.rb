class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :drawing

  validates :user_id, presence: true
  validates :drawing_id, presence: true
  validates_uniqueness_of :user_id, scope: :drawing_id
end