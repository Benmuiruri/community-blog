require 'rails_helper'

RSpec.describe 'Users Index', type: :system do
  it 'Shows the static text' do
    visit users_path
    expect(page).to have_content('Here is the list of all Users')
  end
end