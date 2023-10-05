require 'rails_helper'

RSpec.describe JournalEntriesController, type: :controller do
  let(:entry) { FactoryBot.create(:journal_entry) }
  let(:valid_params) { FactoryBot.attributes_for(:journal_entry) }

  describe 'GET #index' do
    let(:entry2) { FactoryBot.create(:journal_entry) }
    it 'populates an array of all journal entries' do
      get :index
      expect(assigns(:journal_entries)).to match_array [entry, entry2]
    end
  end
end
