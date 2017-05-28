# frozen_string_literal: true

class ProductIndexerJob < ApplicationJob
  queue_as :high_priority

  def perform
    AmazonProduct.reindex
  end
end
