# frozen_string_literal: true
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'autoprefixer-rails'
gem 'coffee-rails', '~> 4.2'
gem 'dotenv-rails', '~> 2.2.0'
gem 'http'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'normalize-rails'
gem 'oga'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.2'
gem 'sass-rails', '~> 5.0'
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'
gem 'sidekiq'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'simplecov', require: false
end

group :test do
  gem 'codeclimate-test-reporter'
  gem 'database_cleaner'
  gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'lograge'
  gem 'logstash-event'
  gem 'logstash-logger'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
