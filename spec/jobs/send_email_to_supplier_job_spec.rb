require 'rails_helper'

RSpec.describe SendEmailToSupplierJob, type: :job do
  include ActiveJob::TestHelper

  let(:product) { create(:product) }

  it "checking job class name" do
    expect { SendEmailToSupplierJob.perform_later }
      .to have_enqueued_job(SendEmailToSupplierJob)
  end

  it "checking job enqueued time" do
    expect { SendEmailToSupplierJob.perform_later }
      .to have_enqueued_job.on_queue("emails")
  end

  it "checking passed arguments to job" do
    expect { SendEmailToSupplierJob.perform_later(product) }
      .to have_enqueued_job.with(product)
  end

  it 'executes perform' do
    SupplierMailer.registered_product(product).deliver_now
    perform_enqueued_jobs { SendEmailToSupplierJob.perform_later(product) }
  end

  it 'handles no results error' do
    allow(SupplierMailer).to receive(:registered_product).and_raise(Timeout::Error)

    perform_enqueued_jobs do
      expect_any_instance_of(SendEmailToSupplierJob)
        .to receive(:retry_job).with(wait: 1.minutes, queue: :high_priority)

      SendEmailToSupplierJob.perform_later(product)
    end
  end
end
