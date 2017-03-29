require 'rails_helper'

RSpec.describe Amazon::ProductAdvertisingApi::Parsers::ItemLookup do
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

  describe '.error_messages?' do
    describe 'with a response with error_messages' do
      let(:xml) { file_fixture('item_lookup/error.xml') }

      it 'returns true' do
        expect(item_lookup.error_messages).to eq({
          code: 'MissingClientTokenId',
          message: 'Request must contain AWSAccessKeyId or X.509 certificate.'
        })
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

  describe '.product_group' do
    it 'returns the product_group' do
      expect(item_lookup.product_group).to eq('Health and Beauty')
    end
  end

  describe '.manufacturer' do
    it 'returns the manufacturer' do
      expect(item_lookup.manufacturer).to eq('Cellucor')
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
      expect(item_lookup.detail_page_url).to eq('https://www.amazon.co.uk/Cellucor-Workout-Powder-Extreme-Servings/dp/B01AX72ZTI%3Fpsc%3D1%26SubscriptionId%3DAKIAJBQEK2NZ32S5X62Q%26tag%3Dohgizmo-21%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB01AX72ZTI')
    end
  end

  describe '.sales_rank' do
    it 'returns the sales_rank' do
      expect(item_lookup.sales_rank).to eq('3704')
    end
  end

  describe '.main_image' do
    it 'returns the main_image' do
      expect(item_lookup.main_image).to eq({
        large: "https://images-eu.ssl-images-amazon.com/images/I/512NZT0uI9L.jpg",
        medium: "https://images-eu.ssl-images-amazon.com/images/I/512NZT0uI9L._SL160_.jpg",
        small: "https://images-eu.ssl-images-amazon.com/images/I/512NZT0uI9L._SL75_.jpg"
      })
    end
  end

  describe '.add_to_wishlist_url' do
    it 'returns the add_to_wishlist_url' do
      expect(item_lookup.add_to_wishlist_url).to eq('https://www.amazon.co.uk/gp/registry/wishlist/add-item.html%3Fasin.0%3DB01AX72ZTI%26SubscriptionId%3DAKIAJBQEK2NZ32S5X62Q%26tag%3Dohgizmo-21%26linkCode%3Dxm2%26camp%3D2025%26creative%3D12734%26creativeASIN%3DB01AX72ZTI')
    end
  end

  describe '.tell_a_friend_url' do
    it 'returns the tell_a_friend_url' do
      expect(item_lookup.tell_a_friend_url).to eq('https://www.amazon.co.uk/gp/pdp/taf/B01AX72ZTI%3FSubscriptionId%3DAKIAJBQEK2NZ32S5X62Q%26tag%3Dohgizmo-21%26linkCode%3Dxm2%26camp%3D2025%26creative%3D12734%26creativeASIN%3DB01AX72ZTI')
    end
  end

  describe '.customer_reviews_url' do
    it 'returns the customer_reviews_url' do
      expect(item_lookup.customer_reviews_url).to eq('https://www.amazon.co.uk/review/product/B01AX72ZTI%3FSubscriptionId%3DAKIAJBQEK2NZ32S5X62Q%26tag%3Dohgizmo-21%26linkCode%3Dxm2%26camp%3D2025%26creative%3D12734%26creativeASIN%3DB01AX72ZTI')
    end
  end

  describe '.all_offers_url' do
    it 'returns the all_offers_url' do
      expect(item_lookup.all_offers_url).to eq('https://www.amazon.co.uk/gp/offer-listing/B01AX72ZTI%3FSubscriptionId%3DAKIAJBQEK2NZ32S5X62Q%26tag%3Dohgizmo-21%26linkCode%3Dxm2%26camp%3D2025%26creative%3D12734%26creativeASIN%3DB01AX72ZTI')
    end
  end

  describe '.list_price' do
    it 'returns the list_price' do
      expect(item_lookup.list_price).to eq({
        amount: '3294',
        currency_code: 'GBP',
        formatted_price: '£32.94'
      })
    end
  end
end
