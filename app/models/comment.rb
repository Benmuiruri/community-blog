class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, class_name: 'Post', foreign_key: :post_id

  validates :text, presence: true, length: { in: 3..250 }

  after_save :update_comments_counter

  def as_json(_)
    super(except: %i[updated_at created_at])
  end
  
  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
