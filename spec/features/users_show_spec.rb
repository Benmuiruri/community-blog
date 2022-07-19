require 'rails_helper'
require 'helpers/create_test_models'
require 'helpers/models_helper'

RSpec.describe 'Users Show page', type: :feature do
  before(:all) do
    @username1 = 'Tom'
    @user1 = create_user(@username1)
    create_posts_for_user(@user1, count: 4)
  end

  it 'shows the profile picture of a user' do
    visit user_path(id: @user1.id)
    find("img[src='https://www.example.com/image']")
  end

  it 'Shows the static text' do
    visit user_path(id: @user1.id)
    expect(page).to have_content(`#{@username1}\'s Most Recent Posts`)
  end

  it 'Shows the User\s name' do
    visit user_path(id: @user1.id)
    expect(page).to have_content @username1
  end

  it 'shows number of user posts ' do
    visit user_path(id: @user1.id)
    expect(page).to have_content('Number of posts: 4')
  end

  it 'shows number of user bio' do
    visit user_path(id: @user1.id)
    expect(page).to have_content('Teacher from Kenya')
  end

  it 'shows a post title' do
    visit user_path(id: @user1.id)
    expect(page).to have_content 'Post 3'
  end

  it 'shows user\s first three posts' do
    visit user_path(id: @user1.id)
    expect(page).to have_selector(:link_or_button, 'See Post', count: 3)
  end

  it 'See post button redirects to show post page' do
    visit user_path(id: @user1.id)
    click_link 'Post 3'
    expect(page).to have_current_path(user_post_path(@user1, @user1.posts.last))
  end

  it 'redirects to all posts when button is clicked' do
    visit user_path(id: @user1.id)
    click_link 'See all posts'
    expect(page).to have_current_path(user_posts_path(@user1))
  end
end
