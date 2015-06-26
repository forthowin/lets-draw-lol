require 'rails_helper'

describe CommentsController do
  describe 'POST create' do
    let(:category) { Fabricate(:category) }
    let(:picture) { Fabricate(:picture, category: category) }
    let(:drawing) { Fabricate(:drawing, category: category, picture: picture) }

    context 'with a signed in user' do
      let(:bob) { Fabricate(:user) }

      context 'with correct input' do
        before do
          sign_in bob
          post :create, format: :js, drawing_id: drawing.id, comment: { body: 'testing' }
        end

        it 'renders the create page' do
          expect(response).to render_template 'create'
        end

        it 'assigns @drawing' do
          expect(assigns(:drawing)).to eq drawing
        end

        it 'creates a comment associated to the user and the drawing' do
          expect(Comment.first.user).to eq bob
          expect(Comment.first.drawing).to eq drawing
        end
      end

      context 'with an incorrect input' do
        before do
          sign_in bob
          post :create, format: :js, drawing_id: drawing.id, comment: { body: '' }
        end

        it 'renders the error page' do
          expect(response).to render_template 'error'
        end
      end
    end

    context 'with a user that is not signed in' do
      before { post :create, format: :js, drawing_id: drawing.id, comment: { body: 'testing' } }

      it 'does not create a comment' do
        expect(Comment.count).to eq 0
      end

      it 'redirects the user to the login/signup path' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end