require 'rails_helper'

describe Users::UsersController do
  describe 'GET show' do
    let(:category) { Fabricate(:category, name: 'Champions') }
    let(:picture) { Fabricate(:picture, category: category) }
    let(:bob) { Fabricate(:user) }

    it 'assigns @user' do
      get :show, id: bob.id
      expect(assigns(:user)).to eq bob
    end

    it 'assigns all of the users drawings' do
      drawing1 = Fabricate(:drawing, category: category, picture: picture, user: bob)
      drawing2 = Fabricate(:drawing, category: category, picture: picture, user: bob)
      drawing3 = Fabricate(:drawing, category: category, picture: picture)
      get :show, id: bob.id
      expect(assigns(:drawings)).to eq [drawing2, drawing1]
    end

    it 'assigns all the drawings that the user likes' do
      drawing1 = Fabricate(:drawing, category: category, picture: picture, user: bob)
      drawing2 = Fabricate(:drawing, category: category, picture: picture, user: bob)
      drawing3 = Fabricate(:drawing, category: category, picture: picture)
      Like.create(drawing: drawing1, user: bob)
      Like.create(drawing: drawing3, user: bob)
      get :show, id: bob.id
      expect(assigns(:like_drawings)).to eq [drawing1, drawing3]
    end
  end
end