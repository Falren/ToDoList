Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks, except: :new
    end
  end
  root 'api/v1/tasks#index'
end
