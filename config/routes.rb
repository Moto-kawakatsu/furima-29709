Rails.application.routes.draw do
  
  devise_for :users
  root to: "items#index"
  get 'items/search' => 'items#search'
  get 'items/result' => 'items#result' 
  get 'items/result' => 'items#result'
  get 'likes/pop_item' => 'likes#pop_item'

  resources :users
  resources :items do
    resources :orders 
    resources :comments
    resource :likes

  end



  post 'posts', to: 'posts#create'
  get 'posts' , to: 'posts#checked'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'

end