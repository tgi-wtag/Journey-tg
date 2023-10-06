require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do
  include FactoryBot::Syntax::Methods

  describe 'POST #create' do
    let(:user) { create(:user, password: FFaker::Internet.password(min_length: 8).to_s) }

    context 'with valid credentials' do
      it 'logs in the user and redirects to root' do
        post :create, params: { user: { email: user.email, password: user.password } }
        expect(session[:user_id]).to eq(user.id)
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq(I18n.t('alerts.login.succesfull'))
      end
    end

    context 'with invalid credentials' do
      it 'does not log in the user and redirects to login page' do
        post :create, params: { user: { email: 'invalid_email', password: 'invalid_password' } }
        expect(session[:user_id]).to be_nil
        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to eq(I18n.t('alerts.login.failed'))
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'logs out the user and redirects to root' do
      delete :destroy
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(root_path)
    end
  end
end
