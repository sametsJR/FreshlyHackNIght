class DishesController < ApplicationController
  def index
    @products_rating = current_user&.products_rating
    @components_rating = current_user&.components_rating
    @dishes_rating = current_user&.dishes_rating

    @dish = current_user&.prefered_dish
    @vote = current_user&.votes.new(dish: @dish)
  end
end
