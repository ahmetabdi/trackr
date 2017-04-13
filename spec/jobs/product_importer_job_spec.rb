# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ProductImporterJob, type: :job do
  include ActiveJob::TestHelper

  subject(:job) { described_class.perform_later('B01AX72ZTI') }

  before do
    ActiveJob::Base.queue_adapter = :test
  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end

  it 'queues the job' do
    expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is in the low_priority queue' do
    expect(subject.queue_name).to eq('low_priority')
  end

  it 'enques the correct job class' do
    expect { ProductImporterJob.perform_later }.to have_enqueued_job(ProductImporterJob)
  end

  it 'enques the job when passed arguments' do
    expect { ProductImporterJob.perform_later('B01AX72ZTI') }.to have_enqueued_job.with('B01AX72ZTI')
  end

  it 'enques the job at a specific time' do
    expect do
      ProductImporterJob.set(wait_until: Date.tomorrow.noon).perform_later
    end.to have_enqueued_job.at(Date.tomorrow.noon)
  end

  it 'enques to the correct queue' do
    expect do
      ProductImporterJob.perform_later
    end.to have_enqueued_job.on_queue('low_priority')
  end

  it 'handles amazons 1 second throttle limit' do
    allow(Amazon::ProductAdvertisingApi::Operator).to receive(:item_lookup).and_raise(AmazonThrottleLimit)

    perform_enqueued_jobs do
      expect_any_instance_of(ProductImporterJob)
        .to receive(:retry_job).with(wait: 1.seconds, queue: :low_priority)

      job
    end
  end

  context 'with a valid response' do
    let(:xml) { file_fixture('item_lookup/valid.xml') }
    let(:item_lookup) { Amazon::ProductAdvertisingApi::ItemLookup.new(xml) }

    before do
      allow(Amazon::ProductAdvertisingApi::Operator).to receive(:item_lookup).and_return(item_lookup)
      perform_enqueued_jobs { job }
    end

    it 'creates an amazon product' do
      expect(AmazonProduct.count).to eq(1)
      expect(AmazonProduct.first.title).to eq('Cellucor C4 50x Pre Workout Powder, Extreme Energy, Icy Blue Razz 45 Servings (405g)')
    end
  end
end
