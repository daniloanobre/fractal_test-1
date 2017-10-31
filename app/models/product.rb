# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :supplier
  belongs_to :place
  has_and_belongs_to_many :categories

  searchkick word_start: [:name]

  validates :name, presence: true

  def search_data
    {
      name: name,
      category: categories.map(&:name)
    }
  end
end
