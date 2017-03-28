VCR.configure do |config|
  config.cassette_library_dir = 'spec/support/vcr/cassettes'
  config.hook_into :webmock

  config.default_cassette_options = {
    match_requests_on: []
  }

  config.filter_sensitive_data('<AMAZON_ACCESS_KEY_ID>') do
    ENV.fetch('AMAZON_ACCESS_KEY_ID')
  end

  config.filter_sensitive_data('<AMAZON_SECRET_KEY>') do
    ENV.fetch('AMAZON_SECRET_KEY')
  end

  config.filter_sensitive_data('<AMAZON_AFFILIATE_ID>') do
    ENV.fetch('AMAZON_AFFILIATE_ID')
  end

  # Only want VCR to intercept requests to external URLs.
  config.ignore_localhost = true
end
