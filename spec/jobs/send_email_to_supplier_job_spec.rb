require 'rails_helper'

RSpec.describe SendEmailToSupplierJob, type: :job do
  ActiveJob::Base.queue_adapter = :test

  it "checking job class name" do
    expect { SendEmailToSupplierJob.perform_later }
      .to have_enqueued_job(SendEmailToSupplierJob)
  end
  it "checking job enqueued time" do
    expect { SendEmailToSupplierJob.perform_later }
      .to have_enqueued_job.on_queue("emails")
  end
  it "checking passed arguments to job" do
    product = create(:product)
    expect { SendEmailToSupplierJob.perform_later(product) }
      .to have_enqueued_job.with(product)
  end
end
