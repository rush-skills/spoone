Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    get "/login", to: "users#login"
    get "/nearby", to: "restaurants#nearby"
  end

  devise_for :users
  resources :restaurants do
    member do
      get "reviews", to: "reviews#index"
      post "reviews", to: "reviews#create"
      get "b/reviews", to: "reviews#big"
      get "s/reviews", to: "reviews#small"
      get "b/static/:sid", to: "swidgets#big"
      get "s/static/:sid", to: "swidgets#small"
      get "b/menu", to: "menus#big"
      get "s/menu", to: "menus#small"
      get "b/text/:tid", to: "texts#big"
      get "s/text/:tid", to: "texts#small"
    end
    resources :texts
    resources :menus
  end
  resources :users
  root to: 'visitors#index'
end
