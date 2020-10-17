Rails.application.routes.draw do
  
  devise_for :users
  root to: "items#index"
  get 'items/search' => 'items#search'
  get 'items/result' => 'items#result' 
  resources :users
  resources :items do
    resources :orders 
    resources :comments

  end



  post 'posts', to: 'posts#create'
  get 'posts' , to: 'posts#checked'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'


end