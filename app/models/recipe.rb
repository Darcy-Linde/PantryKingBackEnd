class Recipe < ApplicationRecord
    has_many :cookbooks
    has_many :users, through: :cookbooks
    has_many :recipe_ingredients
end
