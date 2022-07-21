require 'rails_helper'
require 'helpers/create_test_models'
require 'helpers/models_helper'

RSpec.describe 'Users Show page', type: :feature do
  let(:user) { User.create(name: 'Monica', photo: 'https://www.example.com/image', bio: 'Teacher from Kenya.', posts_counter: 0, email: "benten@gmail.com", password: "123456", confirmed_at: Date.today ) }

  before do
    create_posts_for_user(user, count: 4)
    visit user_path(id: user.id)
  end

  it 'shows the profile picture of a user' do
    find("img[src='https://www.example.com/image']")
  end

  it 'Shows the static text' do
    expect(page).to have_content(`#{@username1}\'s Most Recent Posts`)
  end

  it 'Shows the User\s name' do
    expect(page).to have_content @username1
  end

  it 'shows number of user posts ' do
    expect(page).to have_content('Number of posts: 4')
  end

  it 'shows number of user bio' do
    expect(page).to have_content('Teacher from Kenya')
  end

  it 'shows a post title' do
    expect(page).to have_content 'Post 3'
  end

  it 'shows user\s first three posts' do
    expect(page).to have_selector(:link_or_button, 'See Post', count: 3)
  end

  it 'redirects to all posts when button is clicked' do
    click_link 'See all posts'
    expect(page).to have_current_path(user_posts_path(user))
  end
end
