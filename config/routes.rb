Rails.application.routes.draw do
  resources :basic_user_infos
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end