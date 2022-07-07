require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Monica', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.', posts_counter: 0) }
  let(:post) { Post.create(author: user, title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0) }

  context 'post.title' do
    it 'is not valid with a name less than 3 characters' do
      post.title = 'M'
      expect(post).to_not be_valid
    end

    it 'is valid with a name of more than 3 characters' do
      expect(post).to be_valid
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
end
