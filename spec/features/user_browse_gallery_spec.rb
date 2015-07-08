require 'rails_helper'

feature 'user sort gallery images', :js do
  scenario 'by oldest' do
    cat = Fabricate(:category)
    pic = Fabricate(:picture, category: cat)
    drawing1 = Fabricate(:drawing, category: cat, picture: pic)
    visit drawings_path
    expect(page).to have_content 'Gallery'
  end
end