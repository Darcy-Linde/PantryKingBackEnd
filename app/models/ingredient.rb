class Ingredient < ApplicationRecord
    has_many :pantries
    has_many :users, through: :pantries
end
