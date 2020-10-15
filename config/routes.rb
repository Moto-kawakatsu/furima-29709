Rails.application.routes.draw do
  
  devise_for :users
  root to: "items#index" 
  resources :users
  resources :items do
    resources :orders 
    resources :comments
  end
  post 'posts', to: 'posts#create'
  get 'posts' , to: 'posts#checked'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'

  get 'items/search'
  get 'items/result'
end