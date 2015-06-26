require 'rails_helper'

describe Comment do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :drawing_id }
  it { should validate_presence_of :body }
  it { should belong_to :user }
  it { should belong_to :drawing }
end