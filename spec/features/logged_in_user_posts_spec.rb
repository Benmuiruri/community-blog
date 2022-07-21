require 'rails_helper'
require 'helpers/models_helper'

RSpec.feature 'Users Page' do
  feature 'shows posts' do
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
      click_link @post.title
    end

    scenario 'Loads post show page when post title is clicked' do
      expect(page).to have_content @post.text
    end

    scenario 'Shows the comments of a post' do
      @comments.each { |comment| expect(page).to have_content comment.text }
    end

    scenario 'Shows the number of comments of a post' do
      expect(page).to have_content 'Comments: 2'
    end

    scenario 'Shows the number of likes of a post' do
      expect(page).to have_content 'Likes: 0'
    end
  end
end
