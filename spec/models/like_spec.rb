require 'rails_helper'

describe Like do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :drawing_id }
  it { should belong_to :user }
  it { should belong_to :drawing }

  it 'should validate uniqueness of user_id scopted to drawing_id' do
    bob = Fabricate(:user)
    drawing = Fabricate(:drawing)
    Like.create(user: bob, drawing: drawing)
    Like.create(user: bob, drawing: drawing)
    expect(Like.count).to eq 1
  end
end