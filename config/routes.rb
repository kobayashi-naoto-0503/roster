Rails.application.routes.draw do
  get 'sessions/new'
  root 'logins#index'
  #get 'nurse_work_schedules/show'
  
  resources :nurses
  resources :nurse_work_schedules
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get '/nurses/:id', to: 'nurses#index'
  
  get '/terms/:id/new', to: 'terms#new', as: 'terms'
  post '/terms/:id/create', to: 'terms#create', as: 'terms_create'
  
  get '/hope_holidays/:id/new', to: 'hope_holidays#new', as: 'hope_holidays'
  post '/hope_holidays/:id/create', to: 'hope_holidays#create', as: 'hope_holidays_create'
  
  get '/leaves/:id/new', to: 'leaves#new', as: 'leaves'
  post '/leaves/:id/create', to: 'leaves#create', as: 'leaves_create'
end
