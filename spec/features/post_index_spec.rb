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
      click_link 'My Posts'
    end

    scenario 'shows the user\'s profile picture' do
      expect(page).to have_css "img[src='https://www.example.com/image']"
    end

    scenario 'shows a post\'s title' do
      expect(page).to have_content @post.title
    end

    scenario 'shows some of the post\'s text' do
      expect(page).to have_content @post.text
    end

    scenario 'shows how many comments a post has' do
      expect(page).to have_content 'Comments: 2'
    end

    scenario 'shows how many comments a post has' do
      expect(page).to have_content 'Likes: 0'
    end
  end
end
