require 'rails_helper'

describe 'GET #index', type: :request do
  it 'returns all tasks' do
    get '/tasks'

    expect(response).to have_http_status(:ok)
  end
end


describe 'POST #create', type: :request do
  it 'posts a task' do
    post '/tasks', params: {task: {title: '123', description: '12345', active: true}}
    expect(response).to have_http_status(:created)
  end
end


describe 'DELETE #destroy', type: :request do
  it 'deletes a task' do
    delete '/tasks/1'
    expect(response).to have_http_status(:accepted)
  end
end

