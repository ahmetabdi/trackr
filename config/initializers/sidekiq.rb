require 'sidekiq/web'
require 'sidekiq-cron'

unless Rails.env.test?
  Sidekiq.configure_server do |config|
    config.redis = { url: ENV.fetch('REDIS_URL') }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: ENV.fetch('REDIS_URL') }
  end
end

if Sidekiq::Cron::Job.find('find_and_update_products').nil?
  Sidekiq::Cron::Job.create(
    name: 'find_and_update_products',
    cron: '*/15 * * * *',
    class: 'ProductUpdaterJob'
  )
end
