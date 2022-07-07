class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id

  validates :name, presence: true, length: { in: 3..10 }
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_three_posts
    posts.includes(:author).order(created_at: :DESC).limit(3)
  end
end
