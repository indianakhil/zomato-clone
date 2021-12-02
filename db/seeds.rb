# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# RESTAURANT

# Restaurant.destroy_all

# restaurant1 = Restaurant.create({:name=>"KFC", :cuisine => "Fried Chicken", :open_time => "10 AM", :close_time => "11 PM", :location => "Bareilly"})
# restaurant2 = Restaurant.create({:name=>"Domino's", :cuisine => "Pizzeria", :open_time => "10 AM", :close_time => "11 PM", :location => "Bareilly" })
# restaurant3 = Restaurant.create({:name=>"McDonalds", :cuisine => "Burger Joint", :open_time => "10 AM", :close_time => "11 PM", :location => "Bareilly" })
# restaurant4 = Restaurant.create({:name=>"Ajanta Sweets", :cuisine => "Confectionary",:open_time => "10 AM", :close_time => "11 PM", :location => "Bareilly"})
# restaurant5 = Restaurant.create({:name=>"Baba ka Dhaba", :cuisine => "Dhaba", :open_time => "10 AM", :close_time => "11 PM", :location => "Bareilly"})

# PRODUCT
# Product.destroy_all
product1 = Product.create({:name=>"Chocolate cake", :price => 450, :veg_nveg => "veg", :category => "Cakes", :portion => "Half", :restaurant_id=> 1})
product2 = Product.create({:name=>"Chocolate donuts", :price => 100, :veg_nveg => "veg", :category => "Donuts", :portion => "Full", :restaurant_id=> 1})
product3 = Product.create({:name=>"Vanilla pastry", :price => 50, :veg_nveg => "veg", :category => "Pastries", :portion => "Full", :restaurant_id=> 1})
product4 = Product.create({:name=>"Paneer sandwich", :price => 60, :veg_nveg => "veg", :category => "Sandwiches", :portion => "Half", :restaurant_id=> 3})
product5 = Product.create({:name=>"Cheese burger", :price => 50, :veg_nveg => "veg", :category => "Burgers", :portion => "Half", :restaurant_id=> 3})

# puts "Total number of products: #{Product.all.count}"
# puts "Product names: #{Product.all.pluck("name")}"
# puts "Product1: #{product1.name} price: #{product1.price.round(2)}"
# puts "Product2: #{product2.name} price: #{product2.price.round(2)}"
# puts "Product3: #{product3.name} price: #{product3.price.round(2)}"
# puts "Product4: #{product4.name} price: #{product4.price.round(2)}"
# puts "Product5: #{product5.name} price: #{product5.price.round(2)}"

# CART
# Cart.destroy_all
# puts "\nTotal cart count: #{Cart.all.count}"