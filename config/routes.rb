Rails.application.routes.draw do
  get 'users/show'
  get "rooms/room"
  get "rooms/room_table"
  resources :rooms do
    resources :messages
  end
  root 'pages#home'
  devise_for :users
  
  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end
  get 'user/:id', to: 'users#show', as: 'user' 

  # resources :rooms
end
