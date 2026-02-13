Rails.application.routes.draw do
  
  resources :movies do 
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end

  resource :session, only: [:new, :create, :destroy]
  
  resources :users
  get "signup" => "users#new"
    
 end
