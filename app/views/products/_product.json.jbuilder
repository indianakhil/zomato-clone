json.extract! product, :id, :name, :price, :veg_nveg, :category, :portion, :restaurant_id, :created_at, :updated_at
json.url product_url(product, format: :json)
