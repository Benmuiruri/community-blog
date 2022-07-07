require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user1) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.', posts_counter: 0) }
  let(:user2) { User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.', posts_counter: 0) }
  let(:post) do
    Post.create(author: user1, title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0)
  end
  let(:comment1) { Comment.create(post:, author: user2, text: 'Hi Tom!') }
  let(:comment2) { Comment.create(post:, author: user1, text: 'Hi Lilly!') }
  let(:comment3) { Comment.create(post:, author: user2, text: 'I am doing great just learning Ruby') }
  let(:comment4) do
    Comment.create(post:, author: user1, text: 'That is awesome, I am also learning Ruby')
  end
  let(:comment5) do
    Comment.create(post:, author: user2, text: 'We should do pair programming some time')
  end
  let(:comment6) { Comment.create(post:, author: user1, text: 'Great, I will send you my schedule') }

  context 'post.title' do
    it 'is not valid with a name less than 3 characters' do
      post.title = 'M'
      expect(post).to_not be_valid
    end

    it 'is valid with a name of more than 3 characters' do
      expect(post).to be_valid
    end

    it 'is invalid if longer 250 characters' do
      post.title = 'a' * 251
      expect(post).to_not be_valid
    end
  end

  context 'posts.comments_counter' do
    it 'is not valid if comments_counter is not equal or greater than 0' do
      post.comments_counter = nil
      expect(post).to_not be_valid
    end

    it 'is valid if comments_counter equal or greater than 0' do
      expect(post).to be_valid
    end
  end

  context 'posts.likes_counter' do
    it 'is not valid if likes_counter is not equal or greater than 0' do
      post.likes_counter = nil
      expect(post).to_not be_valid
    end

    it 'is valid if likes_counter equal or greater than 0' do
      expect(post).to be_valid
    end
  end

  context 'post.last_five_comments' do
    it 'returns an empty array if post has not comments' do
      posts_comments = post.last_five_comments
      expected = []
      expect(posts_comments).to eq(expected)
    end

    it 'returns the last five comments of a post' do
      comment1.save!
      comment2.save!
      comment3.save!
      comment4.save!
      comment5.save!
      comment6.save!

      comments = post.last_five_comments.pluck(:text)
      expected = [comment6.text, comment5.text, comment4.text, comment3.text, comment2.text]
      expect(comments).to eq(expected)
    end
  end
end
