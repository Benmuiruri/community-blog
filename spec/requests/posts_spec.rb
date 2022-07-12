# require 'rails_helper'

# RSpec.describe 'Posts', type: :request do
#   describe 'GET /index' do
#     before(:example) { get '/users/9/posts' }

#     it 'is a success' do
#       expect(response).to have_http_status(:ok)
#     end

#     it "renders 'index' template" do
#       expect(response).to render_template(:index)
#     end

#     it 'displays correct content in the view' do
#       expect(response.body).to include('Tom')
#     end
#   end

#   describe 'GET /show' do
#     before(:example) { get '/users/9/posts/24' }

#     it 'is a success' do
#       expect(response).to have_http_status(:ok)
#     end

#     it "renders 'show' template" do
#       expect(response).to render_template(:show)
#     end

#     it 'displays correct content in the view' do
#       expect(response.body).to include('Here is a User post')
#     end
#   end
# end
