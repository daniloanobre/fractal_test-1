class SendEmailToSupplierJob < ApplicationJob
  queue_as :emails

  rescue_from(Timeout::Error) do
    retry_job wait: 1.minutes, queue: :high_priority
  end

  def perform(product)
    SupplierMailer.registered_product(product).deliver_later
  end
end
