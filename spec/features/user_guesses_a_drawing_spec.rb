require 'rails_helper'

feature 'user guesses a drawing', js: true do
  let(:champ_cat) { Fabricate(:category, name: 'Champions') }
  let(:champ_pic) { Fabricate(:picture, category: champ_cat) }

  context 'when they choose the champion category' do
    scenario 'they guess correctly' do
      champ_drawing = Fabricate(:drawing, category: champ_cat, picture: champ_pic)
      visit guess_champions_path
      expect(page).to have_selector("img[src='/cover.jpg']")
      click_button 'Start!'
      expect(page).to have_no_selector("img[src='/cover.jpg']")
      fill_in 'guess', with: champ_drawing.picture.name
      #click 'Submit'
    end
  end
end