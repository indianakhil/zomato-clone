class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :cuisine
      t.time :open_time
      t.time :close_time
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
