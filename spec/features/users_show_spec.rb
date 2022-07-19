require 'rails_helper'
require 'helpers/create_test_models'

RSpec.describe 'Users Show page', type: :feature do
  before(:all) do
    @username1 = 'Tom'
    @user1 = create_user(@username1)
  end

  it 'Shows the static text' do
    visit user_path(id: @user1.id)
    expect(page).to have_content(`#{@username1 }\'s Most Recent Posts`)
  end

  it 'Shows the User\s name' do
    visit user_path(id: @user1.id)
    expect(page).to have_content @username1 
  end

  it 'shows number of user posts ' do
    visit user_path(id: @user1.id)
    expect(page).to have_content('Number of posts: 0')
  end

  it 'shows number of user bio ' do
    visit user_path(id: @user1.id)
    expect(page).to have_content('Teacher from Kenya')
  end

  it 'shows user\s first three posts' do
    visit user_path(id: @user1.id)
    expect(page).to have_button('See Post')
  end
end
