class CreateStaffs < ActiveRecord::Migration[5.0]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :position
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
