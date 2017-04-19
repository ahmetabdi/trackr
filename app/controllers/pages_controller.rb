# frozen_string_literal: true
class PagesController < ApplicationController
  def home
    @amazon_product_categories = AmazonProductCategory.alphabetical
    @amazon_product_groups = AmazonProductGroup.alphabetical
  end

  def search
    url = params[:query]


    # Check if entered string is a URL
    # if url.start_with?('http') ||
    #    url.start_with?('https') ||
    #    url.start_with?('www') ||
    #    url.start_with?('amazon')
# raise regexs.map {|x| url.match(x) }.compact.first[1].inspect
    if asin = fetch_asin(url)
      raise asin.inspect
      Amazon::ProductAdvertisingApi::Scanners::ProductScanner.run(asin)
    else

    end
      #  raise url.match("/([a-zA-Z0-9]{10})(?:[/?]|$)").inspect
    # else
    #   raise 'Not a URL'.inspect
    # end

    redirect_to root_path
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

    match = regexs.each do |regex|
      query = string.match(regex)
      if query
        return query[1]
      end
    end
    nil
  end
end
