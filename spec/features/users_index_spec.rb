require 'rails_helper'
require 'helpers/create_test_models'

RSpec.describe 'Users Index', type: :system do
  before(:all) do
    @username1 = 'Tom'
    @user1= create_user(@username1)
  end

  it 'Shows the static text' do
    visit users_path
    expect(page).to have_content('Here is the list of all Users')
  end

  it 'Shows username of user' do
    visit users_path
    expect(page).to have_content(@username1)
  end
end
