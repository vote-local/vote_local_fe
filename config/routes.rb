Rails.application.routes.draw do
  root "welcome#index"

  get '/auth/twitter/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#show'

  get '/search', to: 'search#search'

  resources :representatives, only: [:index]
end
