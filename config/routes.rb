Rails.application.routes.draw do
  resources :bids
  resources :auctions
  resources :bills
  devise_for :users
  root to: 'pages#home'
end
