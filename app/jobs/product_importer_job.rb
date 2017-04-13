# frozen_string_literal: true
class ProductImporterJob < ApplicationJob
  queue_as :low_priority
  # throttle threshold: 2, period: 1.second

  rescue_from(AmazonThrottleLimit) do |_|
    retry_job wait: 1.seconds, queue: :low_priority
  end

  def perform(asin)
    Amazon::ProductAdvertisingApi::Scanners::ProductScanner.run(asin)
  end
end
