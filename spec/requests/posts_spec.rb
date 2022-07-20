require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:all) do
    post = FactoryBot.create(:post)
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
      expect(response.body).to include('Joe\'s Posts')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/1/posts/2' }

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
