require 'rails_helper'

RSpec.describe JournalEntriesController, type: :controller do
  let!(:user) do
    FactoryBot.create(:user)
  end

  let!(:journal_entry) do
    FactoryBot.create(:journal_entry, user: user)
  end

  describe 'GET #index' do
    it 'populates an array of all journal entries' do
      get :index
      expect(assigns(:journal_entries)).to eq([journal_entry])
    end
  end
end
