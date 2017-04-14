# frozen_string_literal: true
class AmazonProduct < ApplicationRecord
  has_many :amazon_product_histories
end
