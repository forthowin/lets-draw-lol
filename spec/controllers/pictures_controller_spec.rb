require 'rails_helper'

describe PicturesController do
  describe 'POST start_draw' do
    it 'randomly assigns @champion' do
      category = Fabricate(:category, name: 'Champions')
      Fabricate.times(4, :picture, category: category)
      post :start_draw, format: 'js'
      expect(assigns(:champion)).to be_a Picture
    end
  end
end