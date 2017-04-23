class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :hall, :shelf
  has_many :products
end
