Rails.application.routes.draw do
  
  root :to => 'users#new'
  
  resources :locations do 
    resources :reviews
  end 

  

  resources :reviews, only: [:index, :show]
  post '/locations/:id/reviews/new' => 'reviews#show'


  resources :users

  resources :sessions, only: [:new, :create]

  get '/login' => 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/home', to: 'sessions#home'

  get '/logout' => 'sessions#destroy'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

