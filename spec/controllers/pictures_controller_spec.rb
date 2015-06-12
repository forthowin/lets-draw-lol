require 'rails_helper'

describe PicturesController do
  describe 'GET draw_champion' do
    it 'randomly assigns @champion' do
      category = Fabricate(:category, name: 'Champions')
      Fabricate.times(4, :picture, category: category)
      get :draw_champion
      expect(assigns(:champion)).to be_a Picture
    end
  end
end