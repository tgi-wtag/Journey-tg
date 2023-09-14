require 'rails_helper'

RSpec.describe JournalEntriesController, type: :controller do
  let!(:journal_entry1) { FactoryBot.create(:journal_entry) }
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @journal_entries' do
      let!(:journal_entry2) { FactoryBot.create(:journal_entry) }
      get :index
      expect(assigns(:journal_entries)).to eq([journal_entry1, journal_entry2])
    end
  end
end
