require 'rails_helper'
require 'helpers/create_test_models'

RSpec.describe 'Users index page', type: :feature do
  let(:user) { User.create(name: 'Monica', photo: 'https://www.example.com/image', bio: 'Teacher from Kenya.', posts_counter: 0, email: 'benten@gmail.com', password: '123456', confirmed_at: Date.today) }

  before do
    user.save!
  end

  it 'Shows the static text' do
    visit users_path
    expect(page).to have_content('Here is the list of all Users')
  end

  it 'Shows username of user' do
    visit users_path
    expect(page).to have_content(user.name)
  end

  it 'shows the profile picture of user' do
    visit user_path(id: user.id)
    find("img[src='https://www.example.com/image']")
  end

  it 'shows number of user posts ' do
    visit users_path
    expect(page).to have_content('Number of posts: 0')
  end

  it 'takes user to user show page' do
    visit users_path
    click_on user.name
    expect(page).to have_content 'Monica\'s Most Recent Posts'
  end
end
