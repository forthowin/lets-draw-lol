require 'rails_helper'

describe Drawing do
  it { should belong_to :picture }
  it { should belong_to :category }
  it { should belong_to :user }
  it { should have_many :likes }
  it { should have_many(:comments).order("created_at DESC")}
end