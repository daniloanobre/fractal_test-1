class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :hall
      t.string :shelf

      t.timestamps
    end
  end
end
