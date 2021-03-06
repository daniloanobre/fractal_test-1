# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :supplier, foreign_key: true
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
