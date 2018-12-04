Rails.application.routes.draw do

  resources :properties do
    resources :comments
  end
  resources :users
  resources :sessions
  resources :helps


root 'static_pages#home'

  get 'static_pages/home'
  get '/helps', to: "helps#new"
  post '/helps', to: 'helps#create'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


end
