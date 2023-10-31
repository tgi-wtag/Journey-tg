require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  let!(:user) { create(:user) }
  let(:goal) { create(:goal, user: user) }

  before do
    sign_in_user(user)
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index, params: { user_id: user.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new, params: { user_id: user.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    it 'creates a new goal and redirects to user_goals_path' do
      goal_params = attributes_for(:goal, user: user)
      post :create, params: { user_id: user.id, goal: goal_params }
      expect(Goal.last.description).to eq(goal_params[:description])
      expect(response).to redirect_to(user_goals_path)
    end

    it 'fails to create a goal with missing description' do
      post :create, params: { user_id: user.id, goal: { description: '', status: 'setted' } }
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { user_id: user.id, id: goal.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    it 'returns a successful response' do
      get :edit, params: { user_id: user.id, id: goal.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
