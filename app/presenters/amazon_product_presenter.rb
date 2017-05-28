# frozen_string_literal: true
class AmazonProductPresenter < ApplicationPresenter
  attr_accessor :amazon_product

  def initialize(amazon_product)
    @amazon_product = amazon_product
  end

  def main_image
    amazon_product.main_medium_image || ActionController::Base.helpers.asset_path('image.png')
  end

  def price
    amazon_product.current_price / 100.0
  end

  def maximum_price
    (amazon_product.amazon_product_histories.maximum(:price) / 100.0).round(2)
  end

  def average_price
    (amazon_product.amazon_product_histories.average(:price) / 100.0).round(2)
  end

  def minimum_price
    (amazon_product.amazon_product_histories.minimum(:price) / 100.0).round(2)
  end
end
