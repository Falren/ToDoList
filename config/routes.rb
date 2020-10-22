Rails.application.routes.draw do
  resources :tasks, except: :new
end
