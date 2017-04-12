# frozen_string_literal: true
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?

  root to: 'pages#home'
end
