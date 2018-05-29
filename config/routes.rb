Rails.application.routes.draw do
  resources :bills
  resources :auctions, only: [:show, :create, :destroy] do
    resources :bids, only: [:new, :create]
  end
  resources :bids, only: [:index, :show]
  devise_for :users
  root to: 'pages#home'
  get "dashboards", to: "dashboards#index"
  get "dashboards/new", to: "dashboards#new"
  post "dashboards", to: "dashboards#create"
end
