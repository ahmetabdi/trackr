# frozen_string_literal: true
class PagesController < ApplicationController
  def home
    @amazon_product_categories = AmazonProductCategory.alphabetical
    @amazon_product_groups = AmazonProductGroup.alphabetical
  end
end
