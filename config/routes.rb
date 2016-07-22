Rails.application.routes.draw do
  resources :orders
  resources :items
  resources :labels
  resources :users

  root 'orders#index'

end
