Rails.application.routes.draw do
  
  devise_for :users
    root to: "items#index" 
    resources :items
    resources :users
    post 'posts', to: 'posts#create'

    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'

end

