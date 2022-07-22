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
    end

    scenario 'Shows the static text' do
        expect(page).to have_content('Here is the list of all Users')
    end

    scenario 'Shows the static text' do
        expect(page).to have_content('Here is the list of all Users')
    end

         scenario 'shows the user\'s shows username' do
        expect(page).to have_content @user1.name
    end

    scenario 'shows the user\'s profile picture' do
       expect(page).to have_css "img[src='https://www.example.com/image']"
    end

    scenario 'shows the number of posts the user has written' do
        expect(page).to have_content 'Number of posts: 0'
    end

    scenario 'redirects to users show page' do
        click_on @user1.name
       expect(page).to have_content(`#{@username1}\'s Most Recent Posts`)
    end


  end
end
