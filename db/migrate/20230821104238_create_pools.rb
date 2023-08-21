class CreatePools < ActiveRecord::Migration[7.0]
  def change
    create_table :pools do |t|
      t.decimal :price
      t.text :address
      t.text :description
      t.float :length
      t.float :width
      t.float :depth
      t.string :shape
      t.text :facilities

      t.timestamps
    end
  end
end
