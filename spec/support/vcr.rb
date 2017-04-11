# frozen_string_literal: true
VCR.configure do |config|
  config.cassette_library_dir = 'spec/support/vcr/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.ignore_localhost = true
  config.default_cassette_options = {
    match_requests_on: [VCR.request_matchers.uri_without_param(
      'AWSAccessKeyId', 'AssociateTag', 'Signature', 'Timestamp', 'Version'
    )],
    record: :new_episodes
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
end
