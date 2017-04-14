# frozen_string_literal: true
class AmazonProduct < ApplicationRecord
  has_many :amazon_product_histories
  belongs_to :amazon_product_group
end
