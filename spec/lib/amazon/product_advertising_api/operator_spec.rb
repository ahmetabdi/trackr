require 'rails_helper'

RSpec.describe Amazon::ProductAdvertisingApi::Operator do
  describe '.item_lookup' do
    describe 'searches by ASIN as a default' do
      let(:asin) { 'B01AX72ZTI' }

      let(:item_lookup) do
        VCR.use_cassette('operator/item_lookup') do
          described_class.item_lookup(asin)
        end
      end

      it 'should return true' do
        expect(item_lookup).to be_a_kind_of(Amazon::ProductAdvertisingApi::Parsers::ItemLookup)
      end
    end
  end
end
