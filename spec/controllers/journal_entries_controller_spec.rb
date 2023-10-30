require 'rails_helper'

RSpec.describe JournalEntriesController, type: :controller do
  let(:user) { create(:user) }
  let(:journal_entry) { create(:journal_entry, user: user) }

  before {
    sign_in_user(user)
  }

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new, params: { user_id: user.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    it 'creates a new journal entry' do
      entry_params = attributes_for(:journal_entry, user: user)
      post :create, params: { user_id: user.id, journal_entry: entry_params }
      expect(JournalEntry.last.title).to eq(entry_params[:title])
      expect(response).to redirect_to(user_journal_entry_path(user, JournalEntry.last))
    end

    it 'fails to create a journal entry with a missing title' do
      post :create, params: { user_id: user.id, journal_entry: { title: '', date: Date.today, content: 'Sample content' } }
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { user_id: user.id, id: journal_entry.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    it 'returns a successful response' do
      get :edit, params: { user_id: user.id, id: journal_entry.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      it 'updates the journal entry' do
        updated_title = 'Updated Title'
        patch :update, params: { user_id: user.id, id: journal_entry.id, journal_entry: { title: updated_title } }
        journal_entry.reload
        expect(journal_entry.title).to eq(updated_title)
      end

      it 'redirects to the updated journal entry' do
        patch :update, params: { user_id: user.id, id: journal_entry.id, journal_entry: { title: 'Updated Title' } }
        expect(response).to redirect_to(user_journal_entry_path(user, journal_entry))
      end

      it 'sets a success flash message' do
        patch :update, params: { user_id: user.id, id: journal_entry.id, journal_entry: { title: 'Updated Title' } }
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid parameters' do
      it 'does not update the journal entry' do
        patch :update, params: { user_id: user.id, id: journal_entry.id, journal_entry: { title: '' } }
        journal_entry.reload
        expect(journal_entry.title).not_to eq('')
      end

      it 'renders the edit template' do
        patch :update, params: { user_id: user.id, id: journal_entry.id, journal_entry: { title: '' } }
        expect(response).to render_template(:edit)
      end

      it 'sets an error flash message' do
        patch :update, params: { user_id: user.id, id: journal_entry.id, journal_entry: { title: '' } }
        expect(flash[:error]).to be_present
      end
    end
  end
end
