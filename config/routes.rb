Rails.application.routes.draw do
  get 'requests/index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  post '/signup', to: 'users#create'
  root 'static_pages#home'
  resources :users
  resources :account_activations, only: :edit
  resources :microposts, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
  resources :users do
    member do
      get :following, :followers, :friends_list
    end
  end

  resources :users do
    resources :requests, only: :index
  end

  resources :requests, only: %i[create update destroy]
  resources :friendships, only: %i[destroy create]
end
