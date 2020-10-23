require 'rails_helper'

RSpec.describe Api::V1::TasksController, type: :controller do
  describe 'Get tasks' do
    subject { get :index }
    it { is_expected.to have_http_status 200 }
  end
end



