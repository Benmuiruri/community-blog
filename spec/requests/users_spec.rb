require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path }

    it "is a success" do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it "displays correct content in the view" do
      expect(response.body).to include("Here is a list of all Users")
    end
  end

  describe 'GET /show' do
    before(:example) { get user_path(1) }

    it "is a success" do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template(:show)
    end

    it "displays correct content in the view" do
      expect(response.body).to include("Here is the profile of a user")
    end
  end
end
