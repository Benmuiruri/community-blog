require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user1) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.', posts_counter: 0) }
  let(:post) do
    Post.create(author: user1, title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0)
  end
  let(:comment1) { Comment.create(post:, author: user1, text: 'This is my first comment!') }

  context 'comment' do
    it 'cannot be blank' do
      comment1.text = nil
      expect(comment1).to_not be_valid
    end

    it 'is valid if length is 3 characters or more' do
      expect(comment1).to be_valid
    end
  end
end
