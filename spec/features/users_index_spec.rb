require 'rails_helper'
require 'helpers/create_test_models'

RSpec.describe 'Users index page', type: :system do
  before(:all) do
    @username1 = 'Tom'
    @user1= create_user(@username1)
    visit users_path
  end

  it 'Shows the static text' do
    expect(page).to have_content('Here is the list of all Users')
  end

  it 'Shows username of user' do  
    expect(page).to have_content(@username1)
  end

  it 'Number of user posts ' do
    expect(page).to have_content('Number of posts: 0')
  end

  # it 'takes user to user show page' do
  #   click_on @username1
  #   expect(page).to have_content 'Tom\'s Most Recent Posts'
  # end
end
