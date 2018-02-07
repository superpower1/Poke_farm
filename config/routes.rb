Rails.application.routes.draw do
  resources :teams
  resources :users
  resources :shops
  resources :my_pokemons
  resources :experiences, only: [:index]
  resources :species, only: [:index,:show]
  resources :habitats, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'
  root 'pages#home'
  get 'api/teams/get_user_team_api', to: 'teams#get_user_team_api'
  get 'api/habitats/get_catched_pokemon_api', to: 'habitats#get_catched_pokemon_api'
end
