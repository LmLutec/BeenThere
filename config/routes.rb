Rails.application.routes.draw do
  
  root :to => 'users#new'
  
  resources :locations do 
    resources :reviews, only: [:new, :create, :show, :edit]
  end 

  resources :users

  resources :reviews, only: [:index]

  resources :sessions, only: [:new, :create]

  get '/login' => 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/home', to: 'sessions#home'

  get '/logout' => 'sessions#destroy'

  post '/locations/:id/reviews/:id/edit' => 'reviews#update'
  

  # get '/locations/:id/edit' => 'reviews#edit'
  # post '/locations/:id/edit' => 'reviews#update'

  #post '/locations/:id/reviews/new' => 'reviews#show'




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

