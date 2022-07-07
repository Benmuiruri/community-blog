require 'rails_helper'

RSpec.describe User, type: :model do

  let (:user) { User.create(name: 'Monica', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.', posts_counter: 0) }

  before { user.save }

  context 'user.name' do
    it 'is not valid with a name less than 3 characters' do
      user.name = 'M'
      expect(user).to_not be_valid
    end

    it 'is valid with a name of more than 3 characters' do
      expect(user).to be_valid
    end
  end

  context 'user.posts_counter' do
    it 'is not valid if post_counter is not equal or greater than 0' do
      user.posts_counter = nil
      expect(user).to_not be_valid
    end

    it 'is valid if post_counter equal or greater than 0' do
      expect(user).to be_valid
    end
  end

  context '.last_three_posts' do
    let(:post1) { Post.create(author: user, title: 'Hello', text: 'This is my first post') }
    let(:post2) {Post.create(author: user, title: 'Hello', text: 'This is my second post')}
    let(:post3) {Post.create(author: user, title: 'Hello', text: 'This is my third post')}
    let(:post4) {Post.create(author: user, title: 'Hello', text: 'This is my fourth post')}
    let(:post5) {Post.create(author: user, title: 'Hello', text: 'This is my fifth post')}

    it 'returns 0 if user does not have any posts' do
      posts_count = user.last_three_posts.length
      expected = 0
      expect(posts_count).to eq(expected)
    end

    it 'returns 1 if user has one post' do
      post1.save!
      posts_count = user.last_three_posts.length
      expected = 1
      expect(posts_count).to eq(expected)
    end

     it 'returns titles of last three posts if user has more three posts' do
      post2.save!
      post3.save!
      post4.save!
      post5.save!

      posts_count = user.last_three_posts
      titles = posts_count.pluck(:title)
      expected = [post5.title, post4.title, post3.title]

      expect(titles).to eq(expected)
    end
  end
end
