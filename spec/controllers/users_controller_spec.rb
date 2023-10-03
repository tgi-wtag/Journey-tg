require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  include FactoryBot::Syntax::Methods
  describe "GET #new" do
    it "assigns a new User to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:valid_params) { attributes_for(:user) }

      it "creates a new user" do
        expect do
          post :create, params: { user: valid_params }
        end.to change(User, :count).by(1)
      end

      it "redirects to the root path" do
        post :create, params: { user: valid_params }
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid params" do
      let(:invalid_params) do
        {
          user: {
            first_name: "John",
            last_name: "Doe",
            date_of_birth: Date.new(2023, 1, 1),
            joining_date: Date.new(2023, 9, 1),
            designation: "Developer",
            email: "john@example.com",
            password: "password",
            password_confirmation: "wrong_password"
          }
        }
      end

      it "does not create a new user" do
        expect do
          post :create, params: invalid_params
        end.not_to change(User, :count)
      end

      it "renders the new template" do
        post :create, params: invalid_params
        expect(response).to render_template("new")
      end
    end
  end
end
