VCR.configure do |config|
  config.cassette_library_dir = 'spec/support/vcr/cassettes'
  config.hook_into :webmock

  config.filter_sensitive_data('<FILTERED>') { ENV.fetch('AMAZON_ACCESS_KEY_ID') }
  config.filter_sensitive_data('<FILTERED>') { ENV.fetch('AMAZON_SECRET_KEY') }
  config.filter_sensitive_data('<FILTERED>') { ENV.fetch('AMAZON_AFFILIATE_ID') }

  # Only want VCR to intercept requests to external URLs.
  config.ignore_localhost = true
end
