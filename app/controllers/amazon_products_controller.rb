# frozen_string_literal: true

class AmazonProductsController < ApplicationController
  before_action :set_amazon_product, only: [:show]

  def index
    @amazon_products = AmazonProduct.all.page(params[:page]).per(10)
    prepare_meta_tags(title: 'Products')
  end

  def show
    @recorded_prices = @amazon_product.amazon_product_histories.group_by_day(:created_at, format: '%b %-d', series: false).minimum(:price)
    @recorded_sales_ranks = @amazon_product.amazon_product_histories.group_by_day(:created_at, format: '%b %-d', series: false).minimum(:sales_rank)
    prepare_meta_tags(title: @amazon_product.title, image: @amazon_product.variant_large_images.reverse.first)
end

  private

  def set_amazon_product
    @amazon_product = AmazonProduct.friendly.find(params[:id])
    @presenter = AmazonProductPresenter.new(@amazon_product)
  end
end
