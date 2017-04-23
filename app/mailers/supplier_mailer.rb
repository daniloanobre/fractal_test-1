class SupplierMailer < ApplicationMailer
  def registered_product(product)
    @product = product
    mail(to: @product.supplier.email, subject: '[Cadastro] Notificação de Cadastro de Produto')
  end
end
