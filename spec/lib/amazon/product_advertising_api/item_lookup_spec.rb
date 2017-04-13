# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Amazon::ProductAdvertisingApi::ItemLookup, :vcr do
  let(:xml) { file_fixture('item_lookup/valid.xml') }
  let(:item_lookup) { described_class.new(xml) }

  describe '.errors?' do
    describe 'with a response with errors' do
      let(:xml) { file_fixture('item_lookup/error.xml') }

      it 'returns true' do
        expect(item_lookup.errors?).to eq(true)
      end
    end

    describe 'with a response without errors' do
      it 'returns false' do
        expect(item_lookup.errors?).to eq(false)
      end
    end
  end

  describe '.valid?' do
    describe 'with a valid xml response' do
      it 'returns true' do
        expect(item_lookup.valid?).to eq(true)
      end
    end

    describe 'with a invalid xml response' do
      let(:xml) { file_fixture('item_lookup/invalid.xml') }

      it 'returns false' do
        expect(item_lookup.valid?).to eq(false)
      end
    end
  end

  describe '.error_messages' do
    describe 'with a response with error_messages' do
      let(:xml) { file_fixture('item_lookup/error.xml') }

      it 'returns true' do
        expect(item_lookup.error_messages).to eq(code: 'MissingClientTokenId',
                                                 message: 'Request must contain AWSAccessKeyId or X.509 certificate.')
      end
    end

    describe 'with a response without error_messages' do
      it 'returns false' do
        expect(item_lookup.error_messages).to eq(nil)
      end
    end
  end

  describe '.title' do
    it 'returns the title' do
      expect(item_lookup.title).to eq('Cellucor C4 50x Pre Workout Powder, Extreme Energy, Icy Blue Razz 45 Servings (405g)')
    end
  end

  describe '.manufacturer' do
    it 'returns the manufacturer' do
      expect(item_lookup.manufacturer).to eq('Cellucor')
    end
  end

  describe '.binding' do
    it 'returns the binding' do
      expect(item_lookup.binding).to eq('Personal Care')
    end
  end

  describe '.adult_product' do
    it 'returns the adult_product' do
      expect(item_lookup.adult_product).to eq(false)
    end
  end

  describe '.model' do
    it 'returns the model' do
      expect(item_lookup.model).to eq('CLC1027/101/102')
    end
  end

  describe '.ean' do
    it 'returns the ean' do
      expect(item_lookup.ean).to eq('0810390026425')
    end
  end

  describe '.upc' do
    it 'returns the upc' do
      expect(item_lookup.upc).to eq('810390026425')
    end
  end

  describe '.brand' do
    it 'returns the brand' do
      expect(item_lookup.brand).to eq('Cellucor')
    end
  end

  describe '.product_group' do
    it 'returns the product_group' do
      expect(item_lookup.product_group).to eq('Health and Beauty')
    end
  end

  describe '.product_type_name' do
    it 'returns the product_type_name' do
      expect(item_lookup.product_type_name).to eq('HEALTH_PERSONAL_CARE')
    end
  end

  describe '.features' do
    it 'returns the features' do
      expect(item_lookup.features).to eq([
                                           'Stronger than C4 by 50%',
                                           'Contains 50% more of what you love',
                                           'The hardest hitting preworkout Cellucor has ever made',
                                           'Nicotine Free, 0mg Nicotine'
                                         ])
    end
  end

  describe '.total_new' do
    it 'returns the total of new items' do
      expect(item_lookup.total_new).to eq(4)
    end
  end

  describe '.total_used' do
    it 'returns the total of used items' do
      expect(item_lookup.total_used).to eq(0)
    end
  end

  describe '.total_collectible' do
    it 'returns the total of collectible items' do
      expect(item_lookup.total_collectible).to eq(0)
    end
  end

  describe '.total_refurbished' do
    it 'returns the total of refurbished items' do
      expect(item_lookup.total_refurbished).to eq(0)
    end
  end

  describe '.package_quantity' do
    it 'returns the package quantity' do
      expect(item_lookup.package_quantity).to eq(1)
    end
  end

  describe '.part_number' do
    it 'returns the part number' do
      expect(item_lookup.part_number).to eq('CLC1027/101/102')
    end
  end

  describe '.size_of_item' do
    it 'returns the size' do
      expect(item_lookup.size_of_item).to eq('45 Servings')
    end
  end

  describe '.studio' do
    it 'returns the studio' do
      expect(item_lookup.studio).to eq('Cellucor')
    end
  end

  describe '.similar_products' do
    it 'returns the similar_products' do
      expect(item_lookup.similar_products).to eq(%w(
                                                   B01M0OOHQO B016O9LR4I
                                                   B01AB1QIB2 B01B8JX7DI
                                                   B01B8K14GO B00U4621CA
                                                   B00T7L20EC B01ARRW2UG
                                                   B01M323RW7 B00QYZ6MLG
                                                 ))
    end
  end

  describe '.tags' do
    it 'returns the tags' do
      expect(item_lookup.tags).to include('Sports Supplements')
    end
  end

  describe '.asin' do
    it 'returns the asin' do
      expect(item_lookup.asin).to eq('B01AX72ZTI')
    end
  end

  describe '.parent_asin' do
    it 'returns the parent_asin' do
      expect(item_lookup.parent_asin).to eq('B01DCY526W')
    end
  end

  describe '.detail_page_url' do
    it 'returns the detail_page_url' do
      expect(item_lookup.detail_page_url).to eq('https://www.amazon.co.uk/Cellucor-Workout-Powder-Extreme-Servings/dp/B01AX72ZTI?psc=1&SubscriptionId=AKIAJBQEK2NZ32S5X62Q&tag=ohgizmo-21&linkCode=xm2&camp=2025&creative=165953&creativeASIN=B01AX72ZTI')
    end
  end

  describe '.sales_rank' do
    it 'returns the sales_rank' do
      expect(item_lookup.sales_rank).to eq('3187')
    end
  end

  describe '.main_image' do
    it 'returns the main_image' do
      expect(item_lookup.main_image).to eq(large: 'https://images-eu.ssl-images-amazon.com/images/I/512NZT0uI9L.jpg',
                                           medium: 'https://images-eu.ssl-images-amazon.com/images/I/512NZT0uI9L._SL160_.jpg',
                                           small: 'https://images-eu.ssl-images-amazon.com/images/I/512NZT0uI9L._SL75_.jpg')
    end
  end

  describe '.variant_images' do
    it 'returns the variant images' do
      expect(item_lookup.variant_images).to include(
        swatch: 'https://images-eu.ssl-images-amazon.com/images/I/616sHSrTyKL._SL30_.jpg',
        small: 'https://images-eu.ssl-images-amazon.com/images/I/616sHSrTyKL._SL75_.jpg',
        thumbnail: 'https://images-eu.ssl-images-amazon.com/images/I/616sHSrTyKL._SL75_.jpg',
        tiny: 'https://images-eu.ssl-images-amazon.com/images/I/616sHSrTyKL._SL110_.jpg',
        medium: 'https://images-eu.ssl-images-amazon.com/images/I/616sHSrTyKL._SL160_.jpg',
        large: 'https://images-eu.ssl-images-amazon.com/images/I/616sHSrTyKL.jpg'
      )
    end
  end

  describe '.add_to_wishlist_url' do
    it 'returns the add_to_wishlist_url' do
      expect(item_lookup.add_to_wishlist_url).to eq('https://www.amazon.co.uk/gp/registry/wishlist/add-item.html?asin.0=B01AX72ZTI&SubscriptionId=AKIAJBQEK2NZ32S5X62Q&tag=ohgizmo-21&linkCode=xm2&camp=2025&creative=12734&creativeASIN=B01AX72ZTI')
    end
  end

  describe '.tell_a_friend_url' do
    it 'returns the tell_a_friend_url' do
      expect(item_lookup.tell_a_friend_url).to eq('https://www.amazon.co.uk/gp/pdp/taf/B01AX72ZTI?SubscriptionId=AKIAJBQEK2NZ32S5X62Q&tag=ohgizmo-21&linkCode=xm2&camp=2025&creative=12734&creativeASIN=B01AX72ZTI')
    end
  end

  describe '.customer_reviews_url' do
    it 'returns the customer_reviews_url' do
      expect(item_lookup.customer_reviews_url).to eq('https://www.amazon.co.uk/review/product/B01AX72ZTI?SubscriptionId=AKIAJBQEK2NZ32S5X62Q&tag=ohgizmo-21&linkCode=xm2&camp=2025&creative=12734&creativeASIN=B01AX72ZTI')
    end
  end

  describe '.all_offers_url' do
    it 'returns the all_offers_url' do
      expect(item_lookup.all_offers_url).to eq('https://www.amazon.co.uk/gp/offer-listing/B01AX72ZTI?SubscriptionId=AKIAJBQEK2NZ32S5X62Q&tag=ohgizmo-21&linkCode=xm2&camp=2025&creative=12734&creativeASIN=B01AX72ZTI')
    end
  end

  describe '.list_price' do
    it 'returns the list_price' do
      expect(item_lookup.list_price).to eq(amount: '3390',
                                           currency_code: 'GBP',
                                           formatted_price: '£33.90')
    end
  end
end
