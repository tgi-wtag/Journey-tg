require 'rails_helper'

RSpec.describe JournalEntry, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
end
