require 'rails_helper'

describe Drawing do
  it { should belong_to :picture }
  it { should belong_to :category }
end