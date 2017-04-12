redis_conn = proc {
  Redis.new(
    host: ENV.fetch('REDIS_HOST'),
    port: ENV.fetch('REDIS_PORT')
  )
}

Sidekiq.configure_client do |config|
  config.redis = ConnectionPool.new(size: 5, &redis_conn)
end

Sidekiq.configure_server do |config|
  config.redis = ConnectionPool.new(size: 25, &redis_conn)
end
