class AddTagsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :tags, :string, default: ""
  end
end
