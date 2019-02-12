class Restaurant < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }
end

# 1. do not forget ':' semicolum like: inclusion: { in: [...]}
