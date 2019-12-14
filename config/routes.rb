Rails.application.routes.draw do
  resources :vacations
  resources :reviews
  resources :transportations
  resources :users

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :sessions, only: [:new, :create]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
