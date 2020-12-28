Rails.application.routes.draw do
  resources :game_cards
  resources :basic_user_infos
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  get "/search", to: "basic_user_infos#search"
  post 'rails/active_storage/direct_uploads', to: 'direct_uploads#create'
end