require 'rails_helper'
require 'helpers/create_test_models'

RSpec.describe 'Users Show page', type: :feature do
  before(:all) do
    @username1 = 'Tom'
    @user1 = create_user(@username1)
    visit user_path(id: @user1.id)
  end

  it 'Shows the static text' do
    expect(page).to have_content('Tom\'s Most Recent Posts')
  end

  it 'Shows the User\s name' do
    expect(page).to have_content @username1 
  end
end
