require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user1) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.', posts_counter: 0) }
  let(:post) do
    Post.create(author: user1, title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0)
  end
  let(:like) do
    Like.create(post:, author: user1)
  end

  describe Like do
    it { should belong_to(:post) }
  end

  describe 'Like' do
    it 'should increase the like count of a post' do
      like.save!
      post_likes = 2
      expect(post.likes_counter).to eq(post_likes)
    end
  end
end
