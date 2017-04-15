# frozen_string_literal: true
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?

  resources :amazon_products, only: [:index, :show], path: 'products'
  resources :amazon_product_categories, only: [:index, :show], path: 'categories'
  resources :amazon_product_groups, only: [:index, :show], path: 'groups' do
    member do
      get :products
    end
  end

  root to: 'pages#home'
end
