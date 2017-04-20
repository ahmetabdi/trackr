# frozen_string_literal: true
class PagesController < ApplicationController
  def home
    @amazon_product_categories = AmazonProductCategory.alphabetical
    @amazon_product_groups = AmazonProductGroup.alphabetical
  end

  def search
    query = params[:query]
    asin = fetch_asin(query)

    # Check if entered string is a URL
    if asin
      amazon_product = Amazon::ProductAdvertisingApi::Scanners::ProductScanner.run(asin)
      redirect_to amazon_product_path(amazon_product)
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
