# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/twitter/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#show'

  get '/search', to: 'search#search'

  get '/twitter/representatives/:handle', to: 'twitter#get_twitter_id'


  resources :representatives, only: [:index]
end
