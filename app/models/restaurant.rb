class Restaurant < ApplicationRecord
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :name, uniqueness: true, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: CATEGORIES }

  has_many :reviews, dependent: :destroy
end

# 1. do not forget ':' semicolum like: inclusion: { in: [...]}
# 2. should destroy child reviews when destroying self
# When a restaurant is destroyed, all of its reviews should be destroyed as well.
# 3. good to replace category of restaurants into const var -> in form to offer all to choose
