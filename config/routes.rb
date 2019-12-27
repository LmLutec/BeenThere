Rails.application.routes.draw do
  
  root :to => 'users#new'
  
  resources :locations do 
    resources :reviews, only: [:new, :create, :show]
  end 

  resources :users

  resources :locations, only: [:edit]

  resources :reviews, only: [:index,:edit, :update]

  resources :sessions, only: [:new, :create]

  get '/login' => 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/home', to: 'sessions#home'

  get '/logout' => 'sessions#destroy'

  post '/reviews/:id/edit' => 'reviews#update'

  # get '/locations/:id/edit' => 'reviews#edit'
  # post '/locations/:id/edit' => 'reviews#update'

  #post '/locations/:id/reviews/new' => 'reviews#show'




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

