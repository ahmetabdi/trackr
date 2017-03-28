VCR.configure do |config|
  config.cassette_library_dir = 'spec/support/vcr/cassettes'
  config.hook_into :webmock

  config.default_cassette_options = {
    match_requests_on: []
  }

  config.filter_sensitive_data('<AMAZON_ACCESS_KEY_ID>') { ENV.fetch('AMAZON_ACCESS_KEY_ID') }
  config.filter_sensitive_data('<AMAZON_SECRET_KEY>') { ENV.fetch('AMAZON_SECRET_KEY') }
  config.filter_sensitive_data('<AMAZON_AFFILIATE_ID>') { ENV.fetch('AMAZON_AFFILIATE_ID') }

  # Only want VCR to intercept requests to external URLs.
  config.ignore_localhost = true
end
