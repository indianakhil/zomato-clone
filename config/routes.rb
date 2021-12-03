Rails.application.routes.draw do
  devise_for :users
  get 'carts/show'
  # get 'restaurants/index'
  # get 'restaurants/create'
  # get 'restaurants/new'
  # get 'restaurants/edit'
  # get 'restaurants/update'
  # get 'restaurants/show'
  # get 'restaurants/destroy'


  resources :restaurants do
    resources :products
  end
  resources :line_items
  resource :carts, only:[:show, :checkout] # notice resource instead of resources
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'carts/checkout', to: 'carts#checkout', as:'checkout'
  root 'restaurants#home'


end
