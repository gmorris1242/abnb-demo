require 'rails_helper'

describe Host do
  it 'has a valid factory' do
    expect(build(:host)).to be_valid
  end
end
