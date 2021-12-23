Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, controllers: {registrations: "registrations"}
  # devise_for :users, controllers: {sessions: "sessions"}
  # devise_for :users, controllers: {passwords: "passwords"}

  devise_for :controllers => { :registrations => "users/registrations", :sessions => "users/sessions", :passwords =>       "users/passwords" }

  get 'restaurants/:restaurant_id/search', to: "products#search", as:"search"


  get 'carts/show'
  # get 'restaurants/index
  # get 'restaurants/create'
  # get 'restaurants/new'
  # get 'restaurants/edit'
  # get 'restaurants/update'
  # get 'restaurants/show'
  # get 'restaurants/destroy'
  resources :tags
  resources :taggings

  # get 'tags/:tag', to: 'restaurant_products#index', as: :tag
  resources :restaurants do

    resources :products

      # get '/tags/:tag', to: 'products#index', as: :tag
  end
  resources :line_items
  resource :carts, only:[:show, :checkout] # notice resource instead of resources
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'carts/checkout', to: 'carts#checkout', as:'checkout'
  root 'restaurants#home'


  # get '/restaurants/restaurant_id/products/tags/:id', to: 'tags#show', as:'tag_show'

end
