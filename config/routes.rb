Rails.application.routes.draw do
  
  devise_for :users
  root to: "items#index"
  get 'items/search' => 'items#search'
  get 'items/result' => 'items#result' 
  resources :users
  resources :items do
    resources :orders 
    resources :comments
    resource :likes, only: [:create, :destroy]

  end



  post 'posts', to: 'posts#create'
  get 'posts' , to: 'posts#checked'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'

  # get 'favorites/index'
  # post 'favorites', to: 'favorites#create'

end