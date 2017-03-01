class CreateCombos < ActiveRecord::Migration[5.0]
  def change
    create_table :combos do |t|
      t.string :name
      t.string :image
      t.string :description
      t.boolean :active
      t.float :com_value

      t.timestamps
    end
  end
end
