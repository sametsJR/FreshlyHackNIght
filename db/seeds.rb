10.times do
  Product.create({ title: FFaker::Food.meat })
end

10.times do
  component = Component.create({ title: FFaker::Food.ingredient })
  component.product_ids = Product.pluck(:id).shuffle.first(rand(10) + 1)
end

50.times do
  dish = Dish.create({ title: FFaker::Product.product_name })
  dish.component_ids = Component.pluck(:id).shuffle.first(rand(5) + 1)
end

user = User.create(email: 'admin@example.com', password: 'password')

10.times do
  user.votes.create(dish: Dish.all.sample, status: rand(2))
end
