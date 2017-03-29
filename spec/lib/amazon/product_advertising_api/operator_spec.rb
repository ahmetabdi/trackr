require 'rails_helper'

RSpec.describe Amazon::ProductAdvertisingApi::Operator, :vcr do
  describe '.item_lookup' do
    describe 'searches by ASIN as a default' do
      let(:asin) { 'B01AX72ZTI' }
      let(:item_lookup) { described_class.item_lookup(asin) }

      it 'should return a ItemLookup object' do
        expect(item_lookup).to be_a_kind_of(Amazon::ProductAdvertisingApi::Parsers::ItemLookup)
      end
    end
  end
end
