class Dish < ApplicationRecord
  has_and_belongs_to_many :components
  has_many :products, through: :components
end
