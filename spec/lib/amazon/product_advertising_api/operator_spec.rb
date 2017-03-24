require 'rails_helper'

RSpec.describe Amazon::ProductAdvertisingApi::Operator do
  describe '.item_lookup' do
    describe 'searches by ASIN as a default' do
      let(:asin) { 'B01AX72ZTI' }

      it 'should return true' do
        expect(described_class.item_lookup(asin)).to eq('')
      end
    end
  end
end
