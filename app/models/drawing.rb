class Drawing < ActiveRecord::Base
  belongs_to :picture
  belongs_to :category
  belongs_to :user
  has_many :likes
  has_many :comments, -> { order("created_at DESC") }

  mount_uploader :image, ImageUploader

  scope :newest, -> { order("created_at DESC") }
  scope :oldest, -> { order("created_at ASC") }

  def self.popular(search_term)
    joins(:picture)
      .where("name LIKE ?", search_term)
      .select('drawings.*, count(likes.drawing_id) AS like_count')
      .joins('LEFT JOIN likes on drawings.id = likes.drawing_id')
      .group('drawings.id')
      .order('like_count DESC, created_at DESC')
  end

  def self.most_comments(search_term)
    joins(:picture)
      .where("name LIKE ?", search_term)
      .select('drawings.*, count(comments.drawing_id) AS comment_count')
      .joins('LEFT JOIN comments on drawings.id = comments.drawing_id')
      .group('drawings.id')
      .order('comment_count DESC, created_at DESC')
  end

  def self.order_by_dropdown(type, search_term)
    case type
    when "Oldest"
      joins(:picture).where("name LIKE ?", search_term).oldest
    when "Popularity"
      popular(search_term)
    when "Comments"
      most_comments(search_term)
    else
      joins(:picture).where("name LIKE ?", search_term).newest
    end
  end
end