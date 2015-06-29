require 'rails_helper'

describe PagesController do
  describe 'GET front' do
    it 'assigns @drawings the latest 5 drawings' do
      category = Fabricate(:category)
      picture = Fabricate(:picture, category: category)
      drawing1 = Fabricate(:drawing, category: category, picture: picture, created_at: Time.now - 1000)
      drawing2 = Fabricate(:drawing, category: category, picture: picture, created_at: Time.now - 500)
      drawing3 = Fabricate(:drawing, category: category, picture: picture, created_at: Time.now - 200)
      drawing4 = Fabricate(:drawing, category: category, picture: picture, created_at: Time.now)
      drawing5 = Fabricate(:drawing, category: category, picture: picture, created_at: Time.now - 2000)
      get :front
      expect(assigns(:drawings)).to eq [drawing5, drawing1, drawing2, drawing3, drawing4]
    end
  end
end