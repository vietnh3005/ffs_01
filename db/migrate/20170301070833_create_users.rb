class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :phone
      t.integer :point
      t.integer :membership
      t.boolean :is_admin
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
