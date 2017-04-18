# frozen_string_literal: true
class AmazonProductsController < ApplicationController
  before_action :set_amazon_product, only: [:show]

  def index
    @amazon_products = AmazonProduct.all
  end

  private

  def set_amazon_product
    @amazon_product = AmazonProduct.friendly.find(params[:id])
    @presenter = AmazonProductPresenter.new(@amazon_product)
  end
end
