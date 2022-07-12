require 'rails_helper'

RSpec.describe 'Posts', type: :request do
   let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.', posts_counter: 0) }
    let(:post) do
    Post.create(author: user, title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0)
  end
  

  describe 'GET /index' do
    before(:example) { get user_posts_path(user.id) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'displays correct content in the view' do
      expect(response.body).to include('Teacher from Kenya')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_post_path(user.id, post) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template(:show)
    end

    it 'displays correct content in the view' do
      expect(response.body).to include('Hello')
    end
  end
end
