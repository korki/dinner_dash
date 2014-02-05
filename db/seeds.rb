# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([{name: 'Starters'}, {name: 'Main Meals'}, {name: 'Drinks'}])
items = Item.create([
  {name: 'Stella', description: 'Beer', price: 5, category_id: categories.last.id},
  {name: 'Carslberg', description: 'Beer', price: 3, category_id: categories.last.id},
  {name: 'Orange juice', description: 'Soft', price: 7, category_id: categories.last.id},
  {name: 'Garlic bread', description: 'Very good', price: 3, category_id: categories.first.id},
  {name: 'Crisps', description: 'Some old stuff', price: 7, category_id: categories.first.id},
])

user = User.create(
  full_name: 'Franklin Webber', 
  display_name: 'frankw', 
  email: 'franklin.webber@testingstuff.com', 
  crypted_password: 'aaa', 
  salt: 'ssss'
)

Order.create([
  {status: 'completed', order_total: 5, user_id: 1},
  {status: 'ordered', order_total: 4, user_id: 1},
])

OrderItem.create([
  {order_id: 1, item_id: 2, quantity: 2},
  {order_id: 1, item_id: 1, quantity: 3},
  {order_id: 2, item_id: 4, quantity: 1},
])

Cart.create([
  {user_id: 1},
  {user_id: 2},
])

CartItem.create([
  {cart_id: 1, item_id: 2, quantity: 21},
  {cart_id: 1, item_id: 1, quantity: 32},
  {cart_id: 2, item_id: 4, quantity: 10},
])
