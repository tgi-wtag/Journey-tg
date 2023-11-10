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
  let(:user) { create(:user) }

  describe 'JournalEntry' do
    it 'creates an attachment' do
      journal_entry_with_document = FactoryBot.create(:journal_entry, user: user)
      file_path = Rails.root.join('spec/support/pdf_for_testing.pdf')
      journal_entry_with_document.attached_document.attach(io: File.open(file_path), filename: 'pdf_for_testing.pdf', content_type: 'application/pdf')

      expect(journal_entry_with_document.attached_document).to be_attached
    end

    it 'creates a journal entry without an attached document' do
      journal_entry_without_document = FactoryBot.create(:journal_entry, user: user)

      expect(journal_entry_without_document.attached_document).not_to be_attached
    end

    it 'creates multiple journal entries with attached documents' do
      journal_entries = FactoryBot.create_list(:journal_entry, 5, user: user)
      file_path = Rails.root.join('spec/support/pdf_for_testing.pdf')
      journal_entries.each do |entry|
        entry.attached_document.attach(io: File.open(file_path), filename: 'pdf_for_testing.pdf', content_type: 'application/pdf')

        expect(entry.attached_document).to be_attached
      end
    end
  end
end
