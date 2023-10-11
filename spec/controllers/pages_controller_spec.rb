require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let!(:user) do
    FactoryBot.create(:user)
  end

  describe 'GET #home' do
    it 'renders the home page when current_user is blank' do
      get :home
      expect(response).to have_http_status(:ok)
    end

    it 'renders the home page when current_user is present' do
      allow(controller).to receive(:current_user).and_return(user)
      get :home
      expect(response).to have_http_status(:ok)
    end
  end
end
