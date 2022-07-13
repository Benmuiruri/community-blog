require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users' }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'displays correct content in the view' do
      expect(response.body).to include('Here is the list of all Users')
    end
  end

  describe 'GET /show' do
    let!(:user) { User.create(name: 'Monica', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.', posts_counter: 0) }
    before(:example) { get user_path(user.id) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template(:show)
    end

    it 'displays correct content in the view' do
      expect(response.body).to include('Most Recent Posts')
    end
  end
end
