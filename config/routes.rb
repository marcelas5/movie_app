Rails.application.routes.draw do
  resources :favorites
  
  resources :movies do 
    resources :reviews
  end

  resource :session, only: [:new, :create, :destroy]
  
  resources :users
  get "signup" => "users#new"
    
 end
