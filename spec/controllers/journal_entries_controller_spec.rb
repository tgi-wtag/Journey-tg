require 'rails_helper'

RSpec.describe JournalEntriesController, type: :controller do
  let!(:user) { create(:user) }
  let(:journal_entry) { create(:journal_entry, user: user) }

  before do
    sign_in_user(user)
  end

  describe 'GET #index' do
    it 'populates an array of all journal entries' do
      get :index
      expect(assigns(:journal_entries)).to eq([journal_entry])
    end
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    it 'creates a new journal entry' do
      entry_params = attributes_for(:journal_entry, user: user)
      post :create, params: { journal_entry: entry_params }
      expect(JournalEntry.last.title).to eq(entry_params[:title])
      expect(response).to redirect_to(journal_entry_path(JournalEntry.last))
    end

    it 'fails to create a journal entry with a missing title' do
      post :create, params: { journal_entry: { title: '', date: Date.today, content: 'Sample content' } }
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { id: journal_entry.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    it 'returns a successful response' do
      get :edit, params: { id: journal_entry.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      it 'updates the journal entry' do
        updated_title = 'Updated Title'
        patch :update, params: { id: journal_entry.id, journal_entry: { title: updated_title } }
        journal_entry.reload
        expect(journal_entry.title).to eq(updated_title)
      end

      it 'redirects to the updated journal entry' do
        patch :update, params: { id: journal_entry.id, journal_entry: { title: 'Updated Title' } }
        expect(response).to redirect_to(journal_entry_path(journal_entry))
      end

      it 'sets a success flash message' do
        patch :update, params: { id: journal_entry.id, journal_entry: { title: 'Updated Title' } }
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid parameters' do
      it 'does not update the journal entry' do
        patch :update, params: { id: journal_entry.id, journal_entry: { title: '' } }
        journal_entry.reload
        expect(journal_entry.title).not_to eq('')
      end

      it 'renders the edit template' do
        patch :update, params: { id: journal_entry.id, journal_entry: { title: '' } }
        expect(response).to render_template(:edit)
      end

      it 'sets an error flash message' do
        patch :update, params: { id: journal_entry.id, journal_entry: { title: '' } }
        expect(flash[:error]).to be_present
      end
    end
  end
end
