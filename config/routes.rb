Rails.application.routes.draw do
  resources :bills, only: [:show, :new, :create, :edit, :update, :destroy]
  get "dashboard", to: "bills#index"
  resources :auctions, only: [:index, :show, :create, :destroy] do
    resources :bids, only: [:new, :create]
  end
  resources :bids, only: [:index, :show] do
    member do
      get 'select', to: "bids#select"
      get 'pay', to: "bids#pay"
    end
  end
  devise_for :users
  root to: 'pages#home'

  get "provider_dashboard", to: "dashboards#dashboard"

end

