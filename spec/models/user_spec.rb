require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Monica', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.', posts_counter: 0, email: 'benten@gmail.com', password: '123456', confirmed_at: Date.today) }

  context '.name' do
    it 'is not valid with a name less than 3 characters' do
      user.name = 'M'
      expect(user).to_not be_valid
    end

    it 'is valid with a name of more than 3 characters' do
      expect(user).to be_valid
    end
  end

  context '.posts_counter' do
    it 'is not valid if post_counter is not equal or greater than 0' do
      user.posts_counter = nil
      expect(user).to_not be_valid
    end

    it 'is valid if post_counter equal or greater than 0' do
      expect(user).to be_valid
    end
  end

  context '.last_three_posts' do
    let(:post1) do
      Post.create(author: user, title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0)
    end
    let(:post2) do
      Post.create(author: user, title: 'Hello', text: 'This is my second post', likes_counter: 0, comments_counter: 0)
    end
    let(:post3) do
      Post.create(author: user, title: 'Hello', text: 'This is my third post', likes_counter: 0, comments_counter: 0)
    end
    let(:post4) do
      Post.create(author: user, title: 'Hello', text: 'This is my fourth post', likes_counter: 0, comments_counter: 0)
    end
    let(:post5) do
      Post.create(author: user, title: 'Hello', text: 'This is my fifth post', likes_counter: 0, comments_counter: 0)
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

  context '.last_three_posts if user no posts' do
    it 'returns empty array if user does not have any posts' do
      posts_count = user.last_three_posts
      expected = []
      expect(posts_count).to eq(expected)
    end
  end
end
