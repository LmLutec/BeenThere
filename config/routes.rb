Rails.application.routes.draw do
  resources :vacations do 
    resources :reviews, only: [:new, :create, :index, :show]
  end 

  resources :transportations
  resources :users
  

  root :to => 'users#new'

  resources :sessions, only: [:new, :create]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
