class SupplierSerializer < ActiveModel::Serializer
  attributes :id, :company_name, :email
  # has_many :products
end
