# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/twitter/callback', to: 'sessions#create'
  
  get '/dashboard', to: 'dashboard#show'
  post '/dashboard', to: 'dashboard#create'

  get '/search', to: 'search#search'



  resources :representatives, only: [:index, :show]
end
