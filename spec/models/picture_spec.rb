require 'rails_helper'

describe Picture do
  it { should validate_presence_of :name }
  it { should validate_presence_of :category_id }
  it { should validate_presence_of :image }
  it { should belong_to :category }
  it { should have_many :drawings }
end