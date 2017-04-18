# frozen_string_literal: true
class AmazonProductGroupsController < ApplicationController
  before_action :set_amazon_product_group, only: [:show]

  def index
    @amazon_product_groups = AmazonProductGroup.alphabetical
  end

  private

  def set_amazon_product_group
    @amazon_product_group = AmazonProductGroup.friendly.find(params[:id])
  end
end
