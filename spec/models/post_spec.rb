require 'rails_helper'

RSpec.describe Post, type: :model do
  let (:user) { User.create(name: 'Monica', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.', posts_counter: 0) }
  let (:post) { Post.create(author: user, title: 'Hello', text: 'This is my first post') }

   context 'post.title' do
    it 'is not valid with a name less than 3 characters' do
      post.title = 'M'
      expect(post).to_not be_valid
    end

    it 'is valid with a name of more than 3 characters' do
      expect(post).to be_valid
    end
  end
end
