require 'rails_helper'

RSpec.describe Goal, type: :model do
  it 'is valid with valid attributes' do
    goal = Goal.new(description: 'This is an example goal')
    expect(goal).to be_valid
  end
end