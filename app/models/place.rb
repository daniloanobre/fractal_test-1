# frozen_string_literal: true

class Place < ApplicationRecord
  has_many :products

  validates :hall, :shelf, presence: true
end
