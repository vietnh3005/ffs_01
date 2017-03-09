class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.references :location, foreign_key: true
      t.references :order, foreign_key: true
      t.references :staff, foreign_key: true

      t.timestamps
    end
  end
end
