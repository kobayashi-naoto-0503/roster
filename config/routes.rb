Rails.application.routes.draw do
  get 'mains/index'
  get 'hope_holidays/new'
  get 'terms/new'
  get 'sessions/new'
  root 'logins#index'
  
  resources :nurses
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
