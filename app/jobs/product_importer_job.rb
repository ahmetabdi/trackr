class ProductImporterJob < ApplicationJob
  queue_as :default
  throttle threshold: 1, period: 1.second

  rescue_from(AmazonThrottleLimit) do |exception|
    StandardError.new(exception)
  end

  def perform(asin)
    item = Amazon::ProductAdvertisingApi::Operator.item_lookup(asin)
    throttle_limit_check(item)
    create_amazon_product(item) if item.valid?
  end

  private

  # rubocop:disable Metrics/LineLength
  def throttle_limit_check(item)
    return unless item.errors? && item.error_messages[:code] == 'RequestThrottled'
    raise AmazonThrottleLimit
  end

  # rubocop:disable Metrics/BlockLength, Metrics/MethodLength, Metrics/AbcSize
  def create_amazon_product(item)
    ap = AmazonProduct.find_or_create_by(asin: item.asin) do |p|
      p.title = item.title
      p.manufacturer = item.manufacturer
      p.brand = item.brand
      p.product_group = item.product_group
      p.features = item.features
      p.product_type_name = item.product_type_name
      p.binding = item.binding
      p.adult_product = item.adult_product
      p.model = item.model
      p.ean = item.ean
      p.upc = item.upc
      p.asin = item.asin
      p.parent_asin = item.parent_asin
      p.detail_page_url = item.detail_page_url
      p.add_to_wishlist_url = item.add_to_wishlist_url
      p.tell_a_friend_url = item.tell_a_friend_url
      p.customer_reviews_url = item.customer_reviews_url
      p.all_offers_url = item.all_offers_url
      p.current_price = item.list_price[:amount]
      p.current_sales_rank = item.sales_rank
      p.total_new = item.total_new
      p.total_used = item.total_used
      p.total_collectible = item.total_collectible
      p.total_refurbished = item.total_refurbished
      p.package_quantity = item.package_quantity
      p.part_number = item.part_number
      p.size_of_item = item.size_of_item
      p.studio = item.studio
      p.main_large_image = item.main_image[:large]
      p.main_medium_image = item.main_image[:medium]
      p.main_small_image = item.main_image[:small]
      p.variant_large_images = item.variant_images.map { |k, _| k[:large] }
      p.variant_medium_images = item.variant_images.map { |k, _| k[:medium] }
      p.variant_small_images = item.variant_images.map { |k, _| k[:small] }
      p.similar_products = item.similar_products
      p.tags = item.tags
    end
    ap.touch(:scanned_at)
  end
end
