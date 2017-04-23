class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :categories, serializer_each: CategorySerializer
  belongs_to :supplier, serializer: SupplierSerializer
  belongs_to :place, serializer: PlaceSerializer
end
