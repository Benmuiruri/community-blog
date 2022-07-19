require 'rails_helper'

RSpec.describe 'Users Index', type: :system do
  before(:all) do
    user = User.create(name: "Tom", photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.', posts_counter: 0)
    user.save
    user2 = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.', posts_counter: 0)
    user2.save
  end

  it 'Shows the static text' do
    visit users_path
    expect(page).to have_content('Here is the list of all Users')
  end

  it 'Shows username of user' do
    visit users_path
    expect(page).to have_content("Tom")
  end
end
