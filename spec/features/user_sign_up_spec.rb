require 'rails_helper'

feature 'user signs up', :js do
  context 'with valid inputs' do
    given(:username) { 'forthowin' }
    given(:email) { 'forthowin@gmail.com' }
    given(:password) { 'password' }

    scenario 'the user logs in at the front page' do
      visit root_path
      click_link 'REGISTERING'
      fill_in_sign_up_form_with_valid_input
      expect(page).to have_content 'forthowin'
    end

    scenario 'the user logs in at the gallery page' do
      visit drawings_path
      expect(page).to have_content 'Gallery'
      click_link 'Login/SignUp'
      within('.left-panel') do
        fill_in_sign_up_form_with_valid_input
      end
      expect(page).to have_content 'forthowin'
      expect(page).to have_content 'Gallery'
    end
  end

  def fill_in_sign_up_form_with_valid_input
    fill_in 'Username', with: username
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
  end

end