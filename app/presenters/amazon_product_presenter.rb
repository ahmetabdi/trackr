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
    return 0 if amazon_product.current_price.nil?
    amazon_product.current_price / 100.0
  end

  def maximum_price
    return 0 if amazon_product.amazon_product_histories.maximum(:price).nil?
    (amazon_product.amazon_product_histories.maximum(:price) / 100.0).round(2)
  end

  def average_price
    return 0 if amazon_product.amazon_product_histories.average(:price).nil?
    (amazon_product.amazon_product_histories.average(:price) / 100.0).round(2)
  end

  def minimum_price
    return 0 if amazon_product.amazon_product_histories.minimum(:price).nil?
    (amazon_product.amazon_product_histories.minimum(:price) / 100.0).round(2)
  end

  def amount_saved
    maximum_price - price
  end
end
