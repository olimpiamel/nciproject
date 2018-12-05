Rails.application.routes.draw do

  resources :properties do
    resources :comments
  end
  resources :users
  resources :sessions
  resources :helps

  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end


root 'static_pages#home'

  get 'static_pages/home'
  get '/helps', to: "helps#new"
  post '/helps', to: 'helps#create'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash


end
