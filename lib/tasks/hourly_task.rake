# frozen_string_literal: true

namespace :hourly_task do
  desc 'Reindexes all'
  task reindex: :environment do
    ProductIndexerJob.perform_later
  end

  desc 'Updates prices of 1 day old products'
  task update_prices: :environment do
    ProductUpdaterJob.perform_later
  end
end
