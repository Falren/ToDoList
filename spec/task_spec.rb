require 'rails_helper'

describe 'Task API', type: :request do
  it 'returns all tasks' do
    get '/tasks'

    expect(response).to have_http_status(:ok)
    #expect(JSON.parse(response.body).size).to eq(1)
  end
end
