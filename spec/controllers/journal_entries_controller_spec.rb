require 'rails_helper'

RSpec.describe JournalEntriesController, type: :controller do
  # let(:journal_entry1) { FactoryBot.build(:journal_entry) } 
  # @journal_entry1 = build(:journal_entry)
  # @journal_entry2 = build(:journal_entry)
  # entry1 = JournalEntry.new
  # entry2 = JournalEntry.new
  # describe 'GET #index' do
  #   it 'returns a successful response' do
  #     get :index
  #     expect(response).to render_template :index
  #   end

  let(:entry) { FactoryBot.create(:journal_entry) }
  let(:valid_params) { FactoryBot.attributes_for(:journal_entry) }

  describe 'GET #index' do
    let(:entry2) { FactoryBot.create(:journal_entry) }
    it 'populates an array of all journal entries' do
      get :index
      expect(assigns(:journal_entries)).to match_array [entry, entry2]
    end

    # it 'assigns @journal_entries' do
    #   # let(:journal_entry2) { FactoryBot.build(:journal_entry) }
      
    #   get :index
    #   expect(assigns(:journal_entries)).to eq([journal_entry1, journal_entry2])
    # end
  end
end
