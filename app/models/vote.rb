class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :dish
  has_many :components, through: :dish
  has_many :products, through: :dish

  enum status: { like: 0, dislike: 1 }

  scope :likes, -> { where(status: :like) }
  scope :dislikes, -> { where(status: :dislike) }
end
