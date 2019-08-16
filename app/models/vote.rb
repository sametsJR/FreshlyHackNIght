class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :dish

  enum status: { like: 0, dislike: 1 }
end
