# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/twitter/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#show'

  get '/search', to: 'search#search'

  get '/twitter/representatives/:handle', to: 'twitter#get_twitter_id'
  get '/twitter/representatives/tweets', to: 'twitter#get_tweets_about_rep'
  get '/twitter/representatives/reptweets', to: 'twitter#recent_rep_tweets'


  resources :representatives, only: [:index]
end
