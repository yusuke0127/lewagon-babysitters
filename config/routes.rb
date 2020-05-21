Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get '/babysitters', to: 'babysitters#index', as: :babysitters
  # get '/babysitters/:id', to: 'babysitters#show', as: :babysitter
  # get '/babysitter/reservations', to: 'reservations#index_babysitter'


  # reservations
  # get '/reservations', to: 'reservations#index', as: :reservations
  # post '/babysitters/:babysitter_id/reservations', to: 'reservations#create'
  resources :babysitters, only: [:index, :show, :new, :create] do
    resources :reservations, only: [:create]
    # get 'reservations', to: 'reservations#index_babysitter'
  end
  resources :reservations, only: [:index]
  resources :users, only: [:show, :update]  do
    resources :babysitters, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/ui", to: 'pages#uidisplay'
end
