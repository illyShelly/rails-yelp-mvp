class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, :rating, presence: true
  validates :rating, inclusion: { in: 0..5 }, numericality: { only_integer: true }
end

# 1. !!! needs to be integer => two {}, numericality: { only_integer: true }
# validates :rating, inclusion: { in: 0..5 }, numericality: { only_integer: true }
