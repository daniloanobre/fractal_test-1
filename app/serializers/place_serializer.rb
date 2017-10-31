# frozen_string_literal: true

class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :hall, :shelf
  # has_many :products
end
