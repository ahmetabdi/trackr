# frozen_string_literal: true

class ProductUpdaterJob < ApplicationJob
  queue_as :high_priority

  def perform
    AmazonProduct.where('scanned_at <= ?', 1.day.ago).each do |product|
      ProductImporterJob.set(queue: :high_priority).perform_later(product.asin)
    end

    # Caches percentage_to_save on the db
    AmazonProduct.select(:id, :current_price).each do |amazon_product|
      amazon_product.percentage_to_save = percentage_to_save(amazon_product)
      amazon_product.save
    end
  end

  private

  def percentage_to_save(amazon_product)
    return 0 if amazon_product.current_price.nil?
    return 0 if amazon_product.amazon_product_histories.count == 0
    ((1 - (amazon_product.current_price.to_f / amazon_product.amazon_product_histories.maximum(:price).to_f)) * 100).round
  end
end
