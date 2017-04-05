ActiveJob::TrafficControl.client = Redis.new(
  host: ENV.fetch('REDIS_HOST'),
  port: ENV.fetch('REDIS_PORT')
)
