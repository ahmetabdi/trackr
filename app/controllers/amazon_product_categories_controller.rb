# frozen_string_literal: true

class AmazonProductCategoriesController < ApplicationController
  before_action :set_amazon_product_category, only: [:show]

  def index
    @amazon_product_categories = AmazonProductCategory.alphabetical
    prepare_meta_tags(title: 'Categories')
  end

  def show
    prepare_meta_tags(title: helpers.friendly_name(@amazon_product_category.name))
  end

  private

  def set_amazon_product_category
    @amazon_product_category = AmazonProductCategory.friendly.find(params[:id])
  end
end
