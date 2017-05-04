unless Rails.env.test?
  ActiveJob::TrafficControl.client = ConnectionPool.new(size: 5, timeout: 5) {
    Redis.new
  }
end
