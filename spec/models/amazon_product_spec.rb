# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AmazonProduct, type: :model do
  describe 'for the attributes' do
    it 'correctly responds' do
      expect(subject).to respond_to(:asin)
      expect(subject).to respond_to(:title)
      expect(subject).to respond_to(:manufacturer)
      expect(subject).to respond_to(:brand)
      expect(subject).to respond_to(:features)
      expect(subject).to respond_to(:product_type_name)
      expect(subject).to respond_to(:adult_product)
      expect(subject).to respond_to(:model)
      expect(subject).to respond_to(:ean)
      expect(subject).to respond_to(:upc)
      expect(subject).to respond_to(:asin)
      expect(subject).to respond_to(:parent_asin)
      expect(subject).to respond_to(:detail_page_url)
      expect(subject).to respond_to(:add_to_wishlist_url)
      expect(subject).to respond_to(:tell_a_friend_url)
      expect(subject).to respond_to(:customer_reviews_url)
      expect(subject).to respond_to(:all_offers_url)
      expect(subject).to respond_to(:current_price)
      expect(subject).to respond_to(:current_sales_rank)
      expect(subject).to respond_to(:total_new)
      expect(subject).to respond_to(:total_used)
      expect(subject).to respond_to(:total_collectible)
      expect(subject).to respond_to(:total_refurbished)
      expect(subject).to respond_to(:package_quantity)
      expect(subject).to respond_to(:part_number)
      expect(subject).to respond_to(:size_of_item)
      expect(subject).to respond_to(:studio)
      expect(subject).to respond_to(:main_large_image)
      expect(subject).to respond_to(:main_medium_image)
      expect(subject).to respond_to(:main_small_image)
      expect(subject).to respond_to(:variant_large_images)
      expect(subject).to respond_to(:variant_medium_images)
      expect(subject).to respond_to(:variant_small_images)
      expect(subject).to respond_to(:similar_products)
      expect(subject).to respond_to(:tags)
      expect(subject).to respond_to(:scanned_at)
    end
  end
end
