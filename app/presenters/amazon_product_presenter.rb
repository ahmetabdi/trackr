class AmazonProductPresenter < ApplicationPresenter
  attr_accessor :amazon_product

  def initialize(amazon_product)
    @amazon_product = amazon_product
  end

  def main_image
    amazon_product.main_large_image || ActionController::Base.helpers.image_path('image')
  end
end
