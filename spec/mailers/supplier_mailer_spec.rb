# frozen_string_literal: true

require "rails_helper"

RSpec.describe SupplierMailer, type: :mailer do
  describe "instructions" do
    let(:product) { create(:product) }
    let(:mail) { SupplierMailer.registered_product(product).deliver_now }

    it "checking send email to supplier" do
      expect { mail }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it "renders the subject" do
      expect(mail.subject).to eq("[Cadastro] Notificação de Cadastro de Produto")
    end

    it "renders the receiver email" do
      expect(mail.to).to eq([product.supplier.email])
    end

    it "renders the sender email" do
      expect(mail.from).to eq(["from@example.com"])
    end

    it "assigns @company_name" do
      expect(mail.body.encoded).to match(product.supplier.company_name)
    end

    it "assigns @email" do
      expect(mail.body.encoded).to match(product.supplier.email)
    end
  end
end
