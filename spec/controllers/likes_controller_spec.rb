require 'rails_helper'

describe LikesController do
  describe 'POST create' do
    let(:category) { Fabricate(:category, name: 'Champions') }
    let(:picture) { Fabricate(:picture, category: category) }
    let(:bob) { Fabricate(:user) }
    let(:drawing) { Fabricate(:drawing, category: category, picture: picture)}

    context 'with a signed in user' do
      before { sign_in bob }

      it 'creates a like associated with the user and drawing if it does not exist yet' do
        post :create, drawing_id: drawing.id, format: :js
        expect(Like.first.user_id).to eq bob.id
        expect(Like.first.drawing_id).to eq drawing.id
      end

      it 'destroys the like object if it already exists' do
        Like.create(drawing: drawing, user: bob)
        post :create, drawing_id: drawing.id, format: :js
        expect(Like.count).to eq 0
      end
    end

    context 'with a user that is not signed in' do
      before { post :create, drawing_id: drawing.id, format: :js }

      it 'does not create a like object' do
        expect(Like.count).to eq 0
      end

      it 'redirects to the sign in page' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end