class SendEmailToSupplierJob < ApplicationJob
  queue_as :emails

  rescue_from(Timeout::Error) do
    retry_job wait: 1.minutes, queue: :high_priority
  end

  def perform(product)
    # The deliver_now not use ActiveJob and I did it to create Delay 
    # and simulate a sophisticated background job.
    SupplierMailer.registered_product(product).deliver_now
  end
end
