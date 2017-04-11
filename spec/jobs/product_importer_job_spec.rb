# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ProductImporterJob, :vcr, type: :job do
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
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is in the default queue' do
    expect(subject.queue_name).to eq('default')
  end

  it 'executes perform' do
    expect(Amazon::ProductAdvertisingApi::Operator).to receive(:item_lookup).with('B01AX72ZTI')
    perform_enqueued_jobs { job }
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
    end.to have_enqueued_job.on_queue('default')
  end

  it 'reports errors' do
    allow_any_instance_of(ProductImporterJob).to receive(:perform).and_raise(AmazonThrottleLimit)
    allow(StandardError).to receive(:new)
    ProductImporterJob.perform_later('B01AX72ZTI')
    expect(StandardError).to have_received(:new).with(AmazonThrottleLimit)
  end
end
