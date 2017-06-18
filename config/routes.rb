# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations:  'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    get '/login', to: 'users/sessions#new'
    get '/register', to: 'users/registrations#new'
    delete '/logout', to: 'users/sessions#destroy'
  end

  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :amazon_products, only: %i[index show], path: 'products'
  resources :amazon_product_categories, only: %i[index show], path: 'categories' do
    resources :amazon_products, only: [:show], path: 'products'
  end
  resources :amazon_product_groups, only: %i[index show], path: 'groups' do
    resources :amazon_products, only: [:show], path: 'products'
  end

  post '/search', to: 'pages#search'
  get '/results', to: 'pages#results'
  get '/popular', to: 'pages#popular'
  get '/largest-savings', to: 'pages#largest_savings'

  root to: 'pages#home'
end
