require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do
  describe 'POST #create' do
    it 'logs in the user and redirects to root with valid credentials' do
      user = create(:user, password: 'valid_password')
      post :create, params: { user: { email: user.email, password: 'valid_password' } }
      expect(session[:user_id]).to eq(user.id)
      expect(response).to redirect_to(root_path)
    end

    it 'sets flash alert and redirects to new user session path with invalid credentials' do
      post :create, params: { user: { email: 'invalid_email', password: 'invalid_password' } }
      expect(session[:user_id]).to be_nil
      expect(flash[:alert]).to eq('Login Failed')
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'DELETE #destroy' do
    it 'logs out the user and redirects to root' do
      user = create(:user)
      session[:user_id] = user.id
      delete :destroy
      expect(session[:user_id]).to be_nil
    end
  end
end
