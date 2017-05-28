# frozen_string_literal: true

namespace :reindex do
  desc 'Reindexes all'
  task all: :environment do
    AmazonProduct.reindex
  end
end
