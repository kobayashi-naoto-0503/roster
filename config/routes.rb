Rails.application.routes.draw do
  get 'sessions/new'
  root 'logins#index'
  
  resources :nurses
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
