class ProductImporterJob < ApplicationJob
  queue_as :default
  throttle threshold: 1, period: 1.second # Only 1 of this job can run every second

  def perform(asin)
    raise asin.inspect
  end

  private

  def create_amazon_product
    AmazonProduct.find_or_create_by(asin: 'Scarlett') do |user|
      user.last_name = 'Johansson'
    end
  end
end
