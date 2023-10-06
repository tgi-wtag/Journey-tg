require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    it 'creates a new user with valid params' do
      valid_params = attributes_for(:user)
      expect do
        post :create, params: { user: valid_params }
      end.to change(User, :count).by(1)
      expect(response).to redirect_to(root_path)
    end

    it 'redirects to the root path with valid params' do
      valid_params = attributes_for(:user)
      post :create, params: { user: valid_params }
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'POST #login' do
   it 'does not log in the user with invalid login credentials' do
      post :create, params: { user: { email: 'invalid_email', password: 'invalid_password' } }
      expect(session[:user_id]).to be_nil
    end
  end
end
