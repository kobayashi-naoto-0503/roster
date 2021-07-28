Rails.application.routes.draw do
  root 'logins#index'
  get 'logins/new'
  
  resources :nurses
end
