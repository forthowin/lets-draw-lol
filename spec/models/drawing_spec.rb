require 'rails_helper'

describe Drawing do
  it { should validate_presence_of :picture_id }
  it { should belong_to :picture }
end