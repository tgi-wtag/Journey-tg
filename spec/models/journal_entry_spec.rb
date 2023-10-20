require 'rails_helper'

RSpec.describe JournalEntry, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }

  it 'is valid with valid attributes' do
    entry = build(:journal_entry)
    expect(entry).to be_valid
  end

  it 'is not valid without a title' do
    entry = build(:journal_entry, title: nil)
    expect(entry).to_not be_valid
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
