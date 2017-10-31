# frozen_string_literal: true

class Supplier < ApplicationRecord
  has_many :products

  EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :company_name, :email, presence: true
  validates :email, uniqueness: true, format: { with: EMAIL }
end
