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


  devise_for :users
  resources :restaurants do
    member do
      get "reviews", to: "reviews#index"
      get "b/reviews", to: "reviews#big"
      get "s/reviews", to: "reviews#small"
      get "b/menu", to: "menus#big"
      get "s/menu", to: "menus#small"
      get "b/text/:tid", to: "text#big"
      get "s/text/:tid", to: "text#small"
    end
    resources :texts
    resources :photos
    resources :menus
    resources :reviews
    resources :widgets
  end
  resources :texts
  resources :reviews
  resources :photos
  resources :menus
  resources :reviews
  resources :widgets
  resources :users
  root to: 'visitors#index'
end
