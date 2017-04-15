namespace :delete do
  desc 'Deletes all data'
  task all: :environment do
    AmazonProductHistory.delete_all
    AmazonProduct.delete_all
    AmazonProductGroup.delete_all
    AmazonProductCategory.delete_all
  end
end
