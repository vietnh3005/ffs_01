class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :parent_id
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
