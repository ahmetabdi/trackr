# frozen_string_literal: true
class ProductUpdaterJob < ApplicationJob
  queue_as :high_priority

  def perform
    AmazonProduct.where('scanned_at <= ?', 1.day.ago).each do |product|
      ProductImporterJob.set(queue: :high_priority).perform_later(product.asin)
    end

    # Caches percentage_to_save on the db
    AmazonProduct.all.each do |amazon_product|
      amazon_product.percentage_to_save = percentage_to_save(amazon_product)
      amazon_product.save
    end
  end

  private

  def percentage_to_save(amazon_product)
    return 0 if amazon_product.current_price.nil?
    return 0 if amazon_product.amazon_product_histories.empty?
    (1 - (amazon_product.current_price / amazon_product.amazon_product_histories.maximum(:price)).round)
  end
end
