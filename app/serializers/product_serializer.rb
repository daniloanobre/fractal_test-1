class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :supplier_id, :place_id, :category_ids
end
