# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.3'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap'
gem 'bootstrap', '~> 4.1.1'
gem 'coffee-rails', '~> 4.2'
gem 'factory_bot_rails'
gem 'faker'
gem 'faraday'
gem 'figaro'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'omniauth-rails_csrf_protection'
gem 'omniauth-twitter'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'rails', '5.2.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'pry'
  gem 'travis'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop-rails'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'orderly'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'vcr'
  gem 'webmock'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
