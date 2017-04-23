class Place < ApplicationRecord
  has_many :products

  validates :hall, :shelf, presence: true
end
