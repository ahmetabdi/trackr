require 'rails_helper'

RSpec.describe Amazon::ProductAdvertisingApi::Parsers::ItemLookup do
  let(:asin) { 'B01AX72ZTI' }
  let(:item_lookup) { Amazon::ProductAdvertisingApi::Operator.item_lookup(asin) }

  describe '.new' do
    describe 'initializes with a xml string' do
      it 'is a pending example'
    end
  end

  describe '.errors?' do
    # describe 'with a response with errors' do
    #   it 'returns true' do
    #     expect(item_lookup.errors?).to eq(true)
    #   end
    # end

    # describe 'with a response without errors' do
    #   it 'returns false' do
    #     expect(item_lookup.errors?).to eq(false)
    #   end
    # end
  end

  describe '.valid?' do
    describe 'with a valid xml response' do
      it 'is a pending example'
    end

    describe 'with a invalid xml response' do
      it 'is a pending example'
    end
  end

  describe '.title' do
    describe 'when the title is present' do
      it 'is a pending example'
    end

    describe 'when the title is not present' do
      it 'is a pending example'
    end
  end

  describe '.product_group' do
    describe 'when the product group is present' do
      it 'is a pending example'
    end

    describe 'when the product group is not present' do
      it 'is a pending example'
    end
  end

  describe '.manufacturer' do
    describe 'when the manufacturer is present' do
      it 'is a pending example'
    end

    describe 'when the manufacturer is not present' do
      it 'is a pending example'
    end
  end

  describe '.asin' do
    describe 'when the asin is present' do
      it 'is a pending example'
    end

    describe 'when the asin is not present' do
      it 'is a pending example'
    end
  end

  describe '.parent_asin' do
    describe 'when the parent_asin is present' do
      it 'is a pending example'
    end

    describe 'when the parent_asin is not present' do
      it 'is a pending example'
    end
  end

  describe '.detail_page_url' do
    describe 'when the detail_page_url is present' do
      it 'is a pending example'
    end

    describe 'when the detail_page_url is not present' do
      it 'is a pending example'
    end
  end

  describe '.sales_rank' do
    describe 'when the sales_rank is present' do
      it 'is a pending example'
    end

    describe 'when the sales_rank is not present' do
      it 'is a pending example'
    end
  end

  describe '.main_image' do
    describe 'when the main_image is present' do
      it 'is a pending example'
    end

    describe 'when the main_image is not present' do
      it 'is a pending example'
    end
  end

  describe '.share_urls' do
    describe 'when the share_urls is present' do
      it 'is a pending example'
    end

    describe 'when the share_urls is not present' do
      it 'is a pending example'
    end
  end

  describe '.list_price' do
    describe 'when the list_price is present' do
      it 'is a pending example'
    end

    describe 'when the list_price is not present' do
      it 'is a pending example'
    end
  end

  describe '.similar_products' do
    describe 'when the similar_products is present' do
      it 'is a pending example'
    end

    describe 'when the similar_products is not present' do
      it 'is a pending example'
    end
  end
end
