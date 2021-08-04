Rails.application.routes.draw do
  get 'mains/index'
  get 'sessions/new'
  root 'logins#index'
  
  resources :nurses
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get '/nurses/:id', to: 'nurses#index'
  
  get '/terms/:nurse_id/new', to: 'terms#new', as: 'terms'
  #post '/comments/:topic_id/create', to: 'comments#create', as: 'comments_create'
end
