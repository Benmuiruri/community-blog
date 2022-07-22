require 'rails_helper'
require 'helpers/models_helper'

RSpec.feature 'Users Page' do
  feature 'shows users' do
    background do
      visit new_user_session_path
      @user1 = User.create(name: 'Monica', photo: 'https://www.example.com/image', bio: 'Teacher from Kenya.',
                           posts_counter: 0, email: 'benten@gmail.com', password: '123456', confirmed_at: Date.today)
      within 'form' do
        fill_in 'Email', with: @user1.email
        fill_in 'Password', with: @user1.password
      end
      click_button 'Log in'
       @post = create_posts_for_user(@user1).first
      @comments = create_comments_for_post_by_user(@post, @user1, count: 2)
      click_link @user1.name
    end

    scenario 'shows the user\'s profile picture' do
       expect(page).to have_css "img[src='https://www.example.com/image']"
    end

    scenario 'Shows the static text' do
        expect(page).to have_content(`#{@username1}\'s Most Recent Posts`)
    end

     scenario 'shows the user\'s shows username' do
        expect(page).to have_content @user1.name
    end

     scenario 'shows the number of posts the user has written' do
        expect(page).to have_content 'Number of posts: 1'
    end

    scenario 'shows user bio' do
        expect(page).to have_content @user1.bio
    end

    scenario 'shows a post title' do
        expect(page).to have_content 'Post 0'
    end

     scenario 'redirects to all posts when see all posts button is clicked' do
        click_link 'See all posts'
        expect(page).to have_current_path(user_posts_path(@user1))
    end

  end
end