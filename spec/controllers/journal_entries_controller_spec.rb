require 'rails_helper'

RSpec.describe JournalEntriesController, type: :controller do
  describe 'GET #index' do
    it 'populates an array of all journal entries' do
      user = create(:user)
      entry = create(:journal_entry, user: user)
      get :index
      expect(assigns(:journal_entries)).to eq([entry])
    end
  end
end
