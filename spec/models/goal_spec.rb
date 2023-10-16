require 'rails_helper'

RSpec.describe Goal, type: :model do
  it 'is valid with valid attributes' do
    goal = build(:goal)
    expect(goal).to be_valid
  end

  it 'is not valid without a description' do
    goal = build(:goal, description: nil)
    expect(goal).to_not be_valid
  end
end
