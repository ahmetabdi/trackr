# frozen_string_literal: true
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'activejob-traffic_control'
gem 'fast_blank', '~> 1.0'
gem 'friendly_id', '~> 5.2', '>= 5.2.1'
gem 'groupdate', '~> 3.2'
gem 'http', '~> 2.2', '>= 2.2.1'
gem 'jbuilder', '~> 2.5'
gem 'nokogiri', '~> 1.7', '>= 1.7.1'
gem 'oga', '~> 2.9'
gem 'oj'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.1'
gem 'searchkick'
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'
gem 'sidekiq'
gem 'uglifier', '>= 1.3.0'

gem 'autoprefixer-rails'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'normalize-rails'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'

group :development, :test do
  gem 'bullet'
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'simplecov', require: false
end

group :test do
  gem 'codeclimate-test-reporter'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'timecop'
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
