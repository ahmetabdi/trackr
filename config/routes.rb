# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
    get '/register', to: 'devise/registrations#new'
    delete '/logout', to: 'devise/sessions#destroy'
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

  root to: 'pages#home'
end
