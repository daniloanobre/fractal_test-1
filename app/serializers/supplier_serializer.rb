# frozen_string_literal: true

class SupplierSerializer < ActiveModel::Serializer
  attributes :id, :company_name, :email
  # has_many :products
end
