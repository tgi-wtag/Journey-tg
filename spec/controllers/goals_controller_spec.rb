require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  let!(:user) { create(:user) }
  let(:goal) { create(:goal, user: user) }

  before do
    sign_in_user(user)
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
    it 'creates a new goal' do
      goal_params = attributes_for(:goal, user: user)
      post :create, params: { goal: goal_params }
      expect(Goal.last.description).to eq(goal_params[:description])
      expect(response).to redirect_to(goal_path(Goal.last))
    end

    it 'fails to create a goal with missing description' do
      post :create, params: { goal: { description: '', status: 'setted' } }
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { id: goal.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    it 'returns a successful response' do
      get :edit, params: { id: goal.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
