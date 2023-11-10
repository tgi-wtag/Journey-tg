require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let!(:user) { create(:user) }
  let(:task) { create(:task, user: user) }

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
    it 'creates a new task and redirects to user_tasks_path' do
      task_params = attributes_for(:task, user: user)
      post :create, params: { user_id: user.id, task: task_params }
      expect(Task.last.title).to eq(task_params[:title])
      expect(response).to redirect_to(user_tasks_path)
    end

    it 'fails to create a task with missing title' do
      post :create, params: { user_id: user.id, task: { title: nil, status: :todo } }
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { user_id: user.id, id: task.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    it 'returns a successful response' do
      get :edit, params: { user_id: user.id, id: task.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PATCH #update' do
    it 'updates the task and redirects to user_task_path' do
      new_title = 'Updated Task Title'
      patch :update, params: { user_id: user.id, id: task.id, task: { title: new_title } }
      expect(task.reload.title).to eq(new_title)
      expect(response).to redirect_to(user_task_path(user, task))
    end

    it 'fails to update the task with missing title' do
      patch :update, params: { user_id: user.id, id: task.id, task: { title: nil } }
      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the task and redirects to user_tasks_path' do
      delete :destroy, params: { user_id: user.id, id: task.id }
      expect(Task.exists?(task.id)).to be_falsey
      expect(response).to redirect_to(user_tasks_path)
    end
  end
end
