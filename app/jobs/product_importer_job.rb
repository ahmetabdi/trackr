class ProductImporterJob < ApplicationJob
  queue_as :default
  throttle threshold: 1, period: 1.second # Only 1 of this job can run every second

  def perform(*args)
    # Do something later
  end

  private

  def create_amazon_product
    AmazonProduct.find_or_create_by(first_name: 'Scarlett') do |user|
      user.last_name = 'Johansson'
    end
  end
end
