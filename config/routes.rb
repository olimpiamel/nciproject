Rails.application.routes.draw do

  resources :conversations do
    resources :messages
  end
  resources :properties do
    resources :comments
  end
  resources :users
  resources :sessions


root 'static_pages#home'

  get 'static_pages/home'
  get 'static_pages/help'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


end
