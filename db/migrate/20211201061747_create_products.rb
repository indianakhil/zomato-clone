class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :veg_nveg
      t.string :category
      t.string :portion
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
