require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include FactoryBot::Syntax::Methods

  describe 'GET #new' do
    it 'assigns a new User to @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) { attributes_for(:user, password: FFaker::Internet.password(min_length: 8).to_s) }

      it 'creates a new user' do
        expect do
          post :create, params: { user: valid_params }
        end.to change(User, :count).by(1)
      end

      it 'redirects to the root path' do
        post :create, params: { user: valid_params }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'POST #login' do
    let(:user) { create(:user) }

    context 'with valid login credentials' do
      it 'logs in the user' do
        post :login, params: { user: { email: user.email, password: user.password } }
        expect(session[:user_id]).to eq(user.id)
      end

      it 'redirects to the root path' do
        post :login, params: { user: { email: user.email, password: user.password } }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid login credentials' do
      it 'does not log in the user' do
        post :login, params: { user: { email: 'invalid_email', password: 'invalid_password' } }
        expect(session[:user_id]).to be_nil
      end

      it 'redirects to the login page' do
        post :login, params: { user: { email: 'invalid_email', password: 'invalid_password' } }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end