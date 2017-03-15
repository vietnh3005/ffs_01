class CreateDiscounts < ActiveRecord::Migration[5.0]
  def change
    create_table :discounts do |t|
      t.string :title
      t.string :description
      t.float :dis_value
      t.date :date_start
      t.date :date_end
      t.integer :status

      t.timestamps
    end
  end
end
