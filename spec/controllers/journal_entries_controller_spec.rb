require 'rails_helper'

RSpec.describe JournalEntriesController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @journal_entries' do
      journal_entry = FactoryBot.create(:journal_entry)
      get :index
      expect(assigns(:journal_entries)).to eq([journal_entry])
    end
  end
end
