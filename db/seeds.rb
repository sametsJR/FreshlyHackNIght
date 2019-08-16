# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do
  Product.create({ title: FFaker::Food.meat })
end

10.times do
  component = Component.create({ title: FFaker::Food.ingredient })
  component.products << Product.all.sample
end

10.times do
  dish = Dish.create({ title: FFaker::Product.product_name })
  dish.components << Component.all.sample
end
