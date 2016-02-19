Rails.application.routes.draw do
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

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
