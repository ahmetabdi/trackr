unless Rails.env.test?
  Sidekiq.configure_server do |config|
    config.redis = { url: "redis://#{ENV.fetch('REDIS_HOST')}:#{ENV.fetch('REDIS_PORT')}" }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: "redis://#{ENV.fetch('REDIS_HOST')}:#{ENV.fetch('REDIS_PORT')}" }
  end
end
