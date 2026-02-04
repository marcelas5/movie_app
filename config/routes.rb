Rails.application.routes.draw do
  resources :movies do 
    resources :reviews
  end

  resources :users
  get "signup" => "users#new"
    
 end
