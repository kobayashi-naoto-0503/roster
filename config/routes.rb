Rails.application.routes.draw do
  get 'mains/index'
  get 'sessions/new'
  root 'logins#index'
  
  resources :nurses
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get '/nurses/:id', to: 'nurses#index'
  
  get '/terms/:id/new', to: 'terms#new', as: 'terms'
  #post '/comments/:id/create', to: 'comments#create', as: 'comments_create'
  
  get '/hope_holidays/:id/new', to: 'hope_holidays#new', as: 'hope_holidays'
  #post '/comments/:id/create', to: 'comments#create', as: 'comments_create'
end
