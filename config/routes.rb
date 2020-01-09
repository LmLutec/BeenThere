Rails.application.routes.draw do
  
  root :to => 'users#new'

  resources :comments
  
  resources :locations do 
    resources :reviews, only: [:new, :create, :show] do 
     resources :comments
    end
  end 

  resources :users

  resources :reviews, only: [:index,:edit, :update, :destroy]
  post '/reviews/:id/edit' => 'reviews#update'


  resources :sessions, only: [:new, :create]
  get '/auth/google_oauth2/callback' => 'sessions#google_auth'


  get '/login' => 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/home', to: 'sessions#home'

  get '/logout' => 'sessions#destroy'




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

