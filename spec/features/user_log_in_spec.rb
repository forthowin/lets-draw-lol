require 'rails_helper'

feature 'user log in', :js do
  scenario 'with invalid credentials' do
    visit root_path
    click_link 'Login/SignUp'
    within('.right-panel') do
      fill_in 'Login', with: 'asdf'
      click_button 'Log In'
    end
    expect(page).to have_content 'Wrong login or password'
  end

  scenario 'with valid credentials' do
    bob = Fabricate(:user)
    visit drawings_path
    click_link 'Login/SignUp'
    within('.right-panel') do
      fill_in 'Login', with: bob.username
      fill_in 'Password', with: bob.password
      click_button 'Log In'
    end
    expect(page).to have_content bob.username
    expect(page).to have_content 'Gallery'
  end
end