class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.srting :address
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
