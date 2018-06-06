Rails.application.routes.draw do
  resources :bills, only: [:show, :new, :create, :edit, :update, :destroy] do
    collection do
      get "new_cat", to: "bills#new_category"
    end
  end
  get "dashboard", to: "bills#index"
  resources :auctions, only: [:index, :show, :create, :destroy] do
    resources :bids, only: [:new, :create]
  end
  resources :bids, only: [:index, :show] do
    member do
      patch 'select', to: "bids#select"
      get 'pay', to: "bids#pay"
    end
  end
  devise_for :users
  root to: 'pages#home'

  get "provider_dashboard", to: "dashboards#dashboard"

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  resources :conversations, only: [:show, :index] do
    resources :messages, only: [:new, :create]
  end

  get "messages", to: "conversations#index"
end

