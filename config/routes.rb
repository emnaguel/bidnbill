Rails.application.routes.draw do
  resources :bills
  resources :auctions, only: [:show, :create, :destroy] do
    resources :bids, only: [:new, :create]
  end
  resources :bids, only: [:index, :show] do
    member do
      get 'select', to: "bids#select"
    end
  end
  devise_for :users
  root to: 'pages#home'
  get "dashboards", to: "dashboards#all_auctions"
end
