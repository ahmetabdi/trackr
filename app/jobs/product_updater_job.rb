# frozen_string_literal: true
class ProductUpdaterJob < ApplicationJob
  queue_as :low_priority

  def perform
    # AmazonProduct.where('scanned_at <= ?', 1.day.ago)
    puts 'Hello'
  end
end
