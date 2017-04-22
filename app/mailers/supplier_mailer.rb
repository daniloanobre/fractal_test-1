class SupplierMailer < ApplicationMailer
  default from: 'contato.travelsafe@gmail.com'

  def registered_product(product)
    @product = product
    mail(to: 'laerciosbezerra@hotmail.com', subject: '[Cadastro] Notificação de Cadastro de Produto')
  end
end
