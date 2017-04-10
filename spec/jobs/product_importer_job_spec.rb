require 'rails_helper'

RSpec.describe ProductImporterJob, :vcr, type: :job do
  let(:error) { AmazonThrottleLimit }

  it 'reports errors' do
    allow_any_instance_of(ProductImporterJob).to receive(:perform)
      .and_raise(error)
    allow(StandardError).to receive(:new)

    ProductImporterJob.perform_now('B01AX72ZTI')

    expect(StandardError).to have_received(:new).with(error)
  end

  describe '.perform' do
    before do
      ProductImporterJob.perform_now('B01AX72ZTI')
    end

    it '' do
      expect(AmazonProduct.count).to eq(1)
    end
  end
end
