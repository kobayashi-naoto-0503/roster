Rails.application.routes.draw do
  root 'logins#index'
  
  resources :nurses
  
  get    '/login',   to: 'logins#new'
  post   '/login',   to: 'logins#create'
  delete '/logout',  to: 'logins#destroy'
end
