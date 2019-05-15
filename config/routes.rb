Rails.application.routes.draw do

  #resources :reviews
  resources :vets
  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  #omniauth callback
  get '/auth/facebook/callback' =>  'sessions#fbcreate'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :pets

  resources :vets do
    resources :pets, only: [:new, :create, :index]
    resources :reviews, only: [:new, :create, :index]
  end




end
