require 'rails_helper'

RSpec.describe Api::V1::TasksController, type: :controller do
  let(:task) { create(:task) }
  let(:task_attributes) { attributes_for(:task) }

  describe '#index' do
    subject { get :index }

    it { is_expected.to have_http_status(:ok) }
  end

  describe '#show' do
    subject { get :show, params: { id: task.id } }

    it { is_expected.to have_http_status(:ok) }
  end

  describe '#create' do
    subject { post :create, params: { task: task_attributes } }

    it { is_expected.to have_http_status(:created) }
  end

  describe '#update' do
    subject { patch :update, params: { id: task.id, task: task_attributes } }

    it { is_expected.to have_http_status(:ok) }
  end

  describe '#destroy' do
    subject { delete :destroy, params: { id: task.id } }

    it { is_expected.to have_http_status(:accepted) }
  end
end
