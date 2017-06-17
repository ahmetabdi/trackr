# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @amazon_product_categories = AmazonProductCategory.alphabetical
    @amazon_product_groups = AmazonProductGroup.alphabetical
    @amazon_products = AmazonProduct.includes(:amazon_product_group).order('percentage_to_save DESC').page(params[:page]).per(12)
    prepare_meta_tags(title: 'Home')
  end

  def popular
    @amazon_product_categories = AmazonProductCategory.alphabetical
    @amazon_product_groups = AmazonProductGroup.alphabetical
    @amazon_products = AmazonProduct.where('current_sales_rank <= 500').includes(:amazon_product_group).order('percentage_to_save DESC').page(params[:page]).per(12)
    prepare_meta_tags(title: 'Popular')
  end

  def search
    query = params[:query]
    asin = fetch_asin(query)
    match = /[A-Za-z0-9]{10}/.match(query)

    if asin
      if amazon_product = AmazonProduct.find_by_asin(asin)
        redirect_to amazon_product_path(amazon_product)
      else
        amazon_product = Amazon::ProductAdvertisingApi::Scanners::ProductScanner.run(asin)

        if amazon_product.nil?
          redirect_to root_path, flash: { notice: "We couldn't find an amazon product for the entered query." }
        else
          redirect_to amazon_product_path(amazon_product)
        end
      end
    elsif !match.nil? # Found ASIN code
      asin = match.to_s

      if amazon_product = AmazonProduct.find_by_asin(asin)
        redirect_to amazon_product_path(amazon_product)
      else
        amazon_product = Amazon::ProductAdvertisingApi::Scanners::ProductScanner.run(asin)

        if amazon_product.nil?
          redirect_to root_path, flash: { notice: "We couldn't find an amazon product for the entered query." }
        else
          redirect_to amazon_product_path(amazon_product)
        end
      end
    else
      redirect_to results_path(query: query)
    end
  end

  def results
    @amazon_products = AmazonProduct.search(params[:query])
  end

  private

  def fetch_asin(string)
    regexs = [
      /ASIN\.1=([A-Z0-9]{10,13})(\/|$|\?|\%|\ )?/i,
      /ASIN=([A-Z0-9]{10,13})(\/|$|\?|\%|\ )?/i,
      /dp\/([A-Z0-9]{10,13})(\/|$|\?|\%|\ )?/i,
      /dp\/product\-description\/([A-Z0-9]{10,13})(\/|$|\?|\%|\ )?/i,
      /product\/([A-Z0-9]{10,13})(\/|$|\?|\%|\ )?/i,
      /.*?offer\-listing\/([A-Z0-9]{10,13})(\/|$|\?|\%|\ )?/i,
      /product\-reviews\/([A-Z0-9]{10,13})(\/|$|\?|\%|\ )?/i,
      /dp\/premier\/([A-Z0-9]{10,13})(\/|$|\?|\%|\ )?/i,
      /d\/.*?\/.*?\/([A-Z0-9]{10,13})(\/|$|\?|\%|\ )?/i
    ]

    regexs.each do |regex|
      query = string.match(regex)
      return query[1] if query
    end
    nil
  end
end
