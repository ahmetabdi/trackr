# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'airbrake', '~> 6.1'
gem 'devise', '~> 4.3'
gem 'fast_blank', '~> 1.0'
gem 'friendly_id', '~> 5.2', '>= 5.2.1'
gem 'groupdate', '~> 3.2'
gem 'http', '~> 2.2', '>= 2.2.2'
gem 'jbuilder', '~> 2.5'
gem 'kaminari', '~> 1.0.1'
gem 'meta-tags', '~> 2.4.1'
gem 'nokogiri', '~> 1.8'
gem 'oga', '~> 2.10'
gem 'oj', '~> 3.2'
gem 'pg', '~> 0.21.0'
gem 'puma', '~> 3.9', '>= 3.9.1'
gem 'rails', '~> 5.1.1'
gem 'searchkick', '~> 2.3.0'
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'
gem 'sidekiq', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'active_link_to'

gem 'newrelic_rpm'

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
  gem 'rubocop', require: false, github: 'bbatsov/rubocop'
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
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
