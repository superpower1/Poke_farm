Rails.application.routes.draw do
  resources :teams
  resources :users
  resources :shops
  resources :my_pokemons
  resources :experiences, only: [:index]
  resources :species, only: [:index,:show]
  resources :habitats, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to: 'users#login'
  # get '/api_index', to: 'species#api_index'
  post '/sesssions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'
  root 'pages#home'

  # get 'api/teams/get_user_team_api', to: 'teams#get_user_team_api'
  # post 'api/habitats/catched_pokemon_api', to: 'habitats#get_catched_pokemon_api'
  # post 'api/habitats/start_catch_pokemon_api', to: 'habitats#start_catch_pokemon_api'
  
  namespace :api do
    resources :species, only: [:show]
    resources :teams, only: [:index]
    resources :habitats, only: [:create, :update] #/api/habitats
  end

end
