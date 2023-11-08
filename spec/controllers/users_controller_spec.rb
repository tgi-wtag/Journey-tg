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

  describe 'POST #create' do
    it 'creates a new user with valid params' do
      valid_params = attributes_for(:user, role: :user)
      expect do
        post :create, params: { user: valid_params }
      end.to change(User, :count).by(1)
      expect(response).to redirect_to(root_path)
    end

    it 'redirects to the root path with valid params' do
      valid_params = attributes_for(:user, role: :user)
      post :create, params: { user: valid_params }
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'PATCH #update_role' do
    let(:user) { create(:user, role: 'admin') }

    it 'when updating the role to user updates the user role to user' do
      patch :update_role, params: { id: user.id, role: 'user' }
      user.reload
      expect(user.role).to eq('user')
    end

    it 'when updating the role to user sets a flash notice when updating to user' do
      patch :update_role, params: { id: user.id, role: 'user' }
      expect(flash[:notice]).to eq(I18n.t('user_role_updated_user'))
    end

    it 'when the role update fails does not change the user role' do
      allow_any_instance_of(User).to receive(:update).and_return(false)
      patch :update_role, params: { id: user.id, role: 'user' }
      user.reload
      expect(user.role).to eq('admin')
    end

    it 'when updating the role to admin sets a flash notice when updating to admin' do
      user = create(:user, role: 'user')
      patch :update_role, params: { id: user.id, role: 'admin' }
      expect(flash[:notice]).to eq(I18n.t('user_role_updated_admin'))
    end
  end
end
