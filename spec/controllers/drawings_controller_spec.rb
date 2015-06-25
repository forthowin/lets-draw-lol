require 'rails_helper'

describe DrawingsController do
  describe 'POST start_draw' do
    it 'randomly assigns @picture based on the picture category' do
      category = Fabricate(:category, name: 'Champions')
      Fabricate.times(4, :picture, category: category)
      post :start_draw, picture_type: category.name, format: 'js'
      expect(assigns(:picture)).to be_a Picture
    end
  end

  describe 'POST start_guess' do
    it 'randomly assigns @drawing based on the picture category' do
      category = Fabricate(:category, name: 'Champions')
      picture = Fabricate(:picture, category: category)
      Fabricate.times(4, :drawing, category: category, picture: picture)
      post :start_guess, picture_type: category.name, format: 'js'
      expect(assigns(:drawing)).to be_a Drawing
    end
  end

  describe 'POST guess_share_buttons' do
    let(:category) { Fabricate(:category, name: 'Champions') }
    let(:picture) { Fabricate(:picture, category: category) }
    let(:drawing) { Fabricate(:drawing, category: category, picture: picture) }

    it 'assigns @drawing by the id passed in from params' do
      post :guess_share_buttons, drawing_id: drawing.id, format: 'js'
      expect(assigns(:drawing)).to eq(drawing)
    end

    it "assigns @result to be true when result params is 'true'" do
      post :guess_share_buttons, drawing_id: drawing.id, result: "true", format: 'js'
      expect(assigns(:result)).to eq(true)
    end

    it "assigns @result to be false when result params is 'false'" do
      post :guess_share_buttons, drawing_id: drawing.id, result: "false", format: 'js'
      expect(assigns(:result)).to eq(false)
    end
  end

  describe 'GET show' do
    let(:category) { Fabricate(:category, name: 'Champions') }
    let(:picture) { Fabricate(:picture, category: category) }
    let(:drawing) { Fabricate(:drawing, category: category, picture: picture) }

    it 'assigns @drawing based on the id in params' do
      get :show, id: drawing.id
      expect(assigns(:drawing)).to eq(drawing)
    end
  end

  describe 'GET index' do
    let(:category) { Fabricate(:category, name: 'Champions') }
    let(:picture1) { Fabricate(:picture, category: category) }
    let(:picture2) { Fabricate(:picture, category: category) }
    let(:drawing1) { Fabricate(:drawing, category: category, picture: picture1, created_at: Time.now - 1000) }
    let(:drawing2) { Fabricate(:drawing, category: category, picture: picture1, created_at: Time.now - 500) }
    let(:drawing3) { Fabricate(:drawing, category: category, picture: picture1, created_at: Time.now - 200) }
    let(:drawing4) { Fabricate(:drawing, category: category, picture: picture2, created_at: Time.now) }

    it 'assigns @drawings in desc order when there are no search and order params' do
      get :index
      expect(assigns(:drawings)).to eq([drawing4, drawing3, drawing2, drawing1])
    end

    it 'removes spaces and special characters from @search when search params is present' do
      get :index, search: 'Lee $%^@!.S in'
      expect(assigns(:search)).to eq('LeeSin')
    end

    it 'assigns @search to nil when there is no search params but order params is present' do
      get :index, order: "Newest"
      expect(assigns(:search)).to be_nil
    end

    it 'assigns @order to match order params' do
      get :index, order: "Oldest"
      expect(assigns(:order)).to eq("Oldest")
    end

    it "assigns @drawings in ASC order when order params is 'Oldest'" do
      get :index, order: "Oldest"
      expect(assigns(:drawings)).to eq([drawing1, drawing2, drawing3, drawing4])
    end

    it "assigns @drawings in DESC order when order params is 'Newest'" do
      get :index, order: "Newest"
      expect(assigns(:drawings)).to eq([drawing4, drawing3, drawing2, drawing1])
    end

    it "assigns @drawings to be only from pictures with the same name as search params" do
      get :index, search: picture1.name
      expect(assigns(:drawings)).to eq([drawing3, drawing2, drawing1])
    end
  end

  describe 'POST create' do
    let(:category) { Fabricate(:category, name: 'Champions') }
    let(:picture) { picture = Fabricate(:picture, category: category) }
    let(:image) { File.new(Rails.root + 'spec/fixtures/test_drawing.png') }
    let(:file) { file = ActionDispatch::Http::UploadedFile.new(tempfile: image, filename: 'blob', content_type: "image/jpeg") }

    context 'with a user that is not signed in' do
      before { post :create, image: file, picture_id: picture.id, category_id: category.id, format: 'js' }

      it 'creates a Drawing' do
        expect(Drawing.count).to eq 1
      end

      it 'uses SecureRandom.uuid to generate the filename' do
        expect(Drawing.first.image_identifier).not_to eq('blob')
        expect(Drawing.first.image_identifier.length).to eq(40)
      end

      it 'appends .png to the end of the filename' do
        expect(Drawing.first.image_identifier[-4,4]).to eq('.png')
      end

      it 'assigns @drawing' do
        expect(assigns(:drawing)).to be_a Drawing
      end

      it 'renders draw_share_buttons.js.erb' do
        expect(response).to render_template 'draw_share_buttons'
      end
    end

    context 'with a signed in user' do
      it 'creates a Drawing belonging to a user if they are logged in' do
        bob = Fabricate(:user)
        sign_in bob
        post :create, image: file, picture_id: picture.id, category_id: category.id, format: 'js'
        expect(Drawing.first.user).to eq bob
      end
    end
  end
end