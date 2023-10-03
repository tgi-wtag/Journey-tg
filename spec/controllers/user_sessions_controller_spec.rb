require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do
  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end
  describe "POST #create" do
    let(:valid_attributes) { { email: "user@example.com", password: "password" } }
    let(:invalid_attributes) { { email: "invalid@example.com", password: "invalid" } }
    let!(:user) { User.create(valid_attributes) }

    context "with valid credentials" do
      it "creates a session and redirects to root path" do
        post :create, params: { user: valid_attributes }
        expect(session[:user_id]).to eq(user.id)
      end
    end
    context "with invalid credentials" do
      it "sets flash alert and redirects to new user session path" do
        post :create, params: { user: invalid_attributes }
        expect(session[:user_id]).to be_nil
        expect(flash[:alert]).to eq("Login failed")
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
