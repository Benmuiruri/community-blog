require 'rails_helper'
require 'helpers/create_test_models'

RSpec.describe 'Users Show page', type: :feature do
  before(:all) do
    @username1 = 'Tom'
    @user1= create_user(@username1)
  end

  it 'Shows the static text' do
    visit user_path(id: @user1.id)
    expect(page).to have_content('Tom\'s Most Recent Posts')
  end

end