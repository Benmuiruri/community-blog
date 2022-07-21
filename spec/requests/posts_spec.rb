require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create(name: 'Monica', photo: 'https://www.example.com/image', bio: 'Teacher from Kenya.', posts_counter: 0, email: 'benten@gmail.com', password: '123456', confirmed_at: Date.today) }
  let!(:post) do
    Post.create(author: user, title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0)
  end

  describe 'GET /index' do
    before { @posts = post, user.save! }
    before(:example) { get user_posts_path(user.id) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'displays correct content in the view' do
      expect(response.body).to include('Monica\'s Posts')
    end
  end
end
