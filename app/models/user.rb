class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :votes
  has_many :vote_dishes, through: :votes, source: :dish

  has_many :like_dishes
  has_many :dislike_dishes

  def products_rating
    @products_rating ||= Product.all.inject({}) do |rating, product|
      rating[product.id] = 0
      votes.likes.each do |vote|
        rating[product.id] += 1 if vote.products.include?(product)
      end
      votes.dislikes.each do |vote|
        rating[product.id] -= 1 if vote.products.include?(product)
      end
      rating
    end
  end

  def components_rating
    @components_rating ||= Component.all.inject({}) do |rating, component|
      rating[component.id] = 0
      votes.likes.each do |vote|
        rating[component.id] += 1 if vote.components.include?(component)
      end
      votes.dislikes.each do |vote|
        rating[component.id] -= 1 if vote.components.include?(component)
      end
      rating
    end
  end

  def unvote_dishes
    @unvote_dishes ||= Dish.where.not(id: vote_dish_ids)
  end

  def dishes_rating
    @dishes_rating ||= unvote_dishes.inject({}) do |rating, dish|
      rating[dish.id] = 0
      dish.components.each do |component|
        rating[dish.id] += components_rating[component.id]
        component.products.each do |product|
          rating[dish.id] += products_rating[product.id]
        end
      end
      rating
    end
  end

  def prefered_dish
    @prefered_dish ||= Dish.find(dishes_rating.to_a.sort_by { |dish, rating| rating }.last.first)
  end
end
