Rails.application.routes.draw do
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  namespace :api do
    get "/login", to: "users#login"
    get "/nearby", to: "restaurants#nearby"
  end

  get "/restaurants/:id/reviews", to: "reviews#big"
  get "/restaurants/:id/s/reviews", to: "reviews#small"
  get "/restaurants/:id/menu", to: "menus#big"
  get "/restaurants/:id/s/menu", to: "menus#small"

  devise_for :users
  resources :texts
  resources :photos
  resources :menus
  resources :reviews
  resources :widgets
  resources :restaurants
  resources :users
  root to: 'visitors#index'
end
