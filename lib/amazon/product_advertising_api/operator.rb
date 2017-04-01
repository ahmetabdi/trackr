class Amazon::ProductAdvertisingApi::Operator
  ENDPOINT = 'webservices.amazon.co.uk'.freeze
  REQUEST_URI = '/onca/xml'.freeze

  class << self
    def item_search
      { 'Operation' => 'ItemSearch' }
    end

    def item_lookup(item_id, id_type = 'ASIN')
      url = url_generator('Operation' => 'ItemLookup',
                          'ItemId' => item_id,
                          'IdType' => id_type,
                          'ResponseGroup' => default_response_groups)

      Amazon::ProductAdvertisingApi::Parsers::ItemLookup.new(HTTP.get(url).to_s)
    end

    private

    def default_response_groups
      %w(
          Accessories
          AlternateVersions
          BrowseNodes
          EditorialReview
          Images
          ItemAttributes
          ItemIds
          Large
          Medium
          OfferFull
          OfferListings
          Offers
          OfferSummary
          PromotionSummary
          Reviews
          SalesRank
          Similarities
          Small
          Tracks
          Variations
          VariationImages
          VariationMatrix
          VariationOffers
          VariationSummary
      ).join(',')
    end

    def default_options
      {
        'Service' => 'AWSECommerceService',
        'AWSAccessKeyId' => ENV.fetch('AMAZON_ACCESS_KEY_ID'),
        'AssociateTag' => ENV.fetch('AMAZON_AFFILIATE_ID'),
        'Timestamp' => Time.now.gmtime.iso8601
      }
    end

    def query_string(params)
      URI.encode_www_form(params.sort)
    end

    # Generate the signature required by the Product Advertising API
    def signature_generator(string)
      Base64.encode64(
        OpenSSL::HMAC.digest(
          OpenSSL::Digest.new('sha256'),
          ENV.fetch('AMAZON_SECRET_KEY'),
          string
        )
      ).strip
    end

    def url_generator(params)
      params = params.merge(default_options)
      query = ['GET', ENDPOINT, REQUEST_URI, query_string(params)].join("\n")
      "http://#{ENDPOINT}#{REQUEST_URI}?#{query_string(params)}&Signature=#{URI.escape(signature_generator(query), Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}"
    end
  end
end
