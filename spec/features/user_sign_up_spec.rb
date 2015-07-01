require 'rails_helper'

feature 'user signs up', :js do
  scenario 'with valid inputs' do
    visit root_path
    click_link 'REGISTERING'
    fill_in 'Username', with: 'forthowin'
    fill_in 'Email', with: 'forthowin@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content 'forthowin'
  end
end