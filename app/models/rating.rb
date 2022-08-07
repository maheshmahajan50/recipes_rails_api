class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :rate, numericality: { in: 1..5 }
  validates :user_id, uniqueness: { scope: :recipe_id }
end
