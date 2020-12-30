Rails.application.routes.draw do
  resources :follows
  resources :favorites
  resources :game_cards
  resources :basic_user_infos
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  get "/search", to: "basic_user_infos#search"
  get "/followings", to: "basic_user_infos#searchfollows"
  get "/followings/check", to: "follows#followcheck"
  post "/followings/update", to: "follows#updatefollows"
  post 'rails/active_storage/direct_uploads', to: 'direct_uploads#create'
end