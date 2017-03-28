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
                          'ResponseGroup' => 'ItemAttributes,SalesRank,Images,Similarities')

      Amazon::ProductAdvertisingApi::Parsers::ItemLookup.new(HTTP.get(url).to_s)
    end

    private

    def default_options
      @default_options ||= {
        'Service' => 'AWSECommerceService',
        'AWSAccessKeyId' => ENV.fetch('AMAZON_ACCESS_KEY_ID'),
        'AssociateTag' => ENV.fetch('AMAZON_AFFILIATE_ID')
      }.freeze
    end

    def url_generator(params)
      # Merge default options
      params = params.merge(default_options)

      # Set current timestamp if not set
      params['Timestamp'] = Time.now.gmtime.iso8601 unless params.key?('Timestamp')

      # Generate the canonical query
      canonical_query_string = URI.encode_www_form(params.sort)

      # Generate the string to be signed
      string_to_sign = "GET\n#{ENDPOINT}\n#{REQUEST_URI}\n#{canonical_query_string}"

      # Generate the signature required by the Product Advertising API
      signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), ENV.fetch('AMAZON_SECRET_KEY'), string_to_sign)).strip

      # Generate the signed URL
      "http://#{ENDPOINT}#{REQUEST_URI}?#{canonical_query_string}&Signature=#{URI.escape(signature, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}"
    end
  end
end
