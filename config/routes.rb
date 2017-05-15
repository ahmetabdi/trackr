# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
    get '/register', to: 'devise/registrations#new'
    delete '/logout', to: 'devise/sessions#destroy'
  end

  mount Sidekiq::Web => '/sidekiq' if ENV.fetch('ENABLE_SIDEKIQ_WEB_INTERFACE')

  resources :amazon_products, only: [:index, :show], path: 'products'
  resources :amazon_product_categories, only: [:index, :show], path: 'categories' do
    resources :amazon_products, only: [:show], path: 'products'
  end
  resources :amazon_product_groups, only: [:index, :show], path: 'groups' do
    resources :amazon_products, only: [:show], path: 'products'
  end

  post '/search', to: 'pages#search'
  get '/results', to: 'pages#results'

  root to: 'pages#home'
end
