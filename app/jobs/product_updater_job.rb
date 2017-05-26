# frozen_string_literal: true
class ProductUpdaterJob < ApplicationJob
  queue_as :high_priority

  def perform
    AmazonProduct.where('scanned_at <= ?', 1.day.ago).each do |product|
      ProductImporterJob.set(queue: :high_priority).perform_later(product.asin)
    end
  end
end
