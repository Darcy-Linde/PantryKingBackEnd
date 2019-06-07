class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

    has_many :cookbooks
    has_many :recipes, through: :cookbooks
    has_many :pantries
    has_many :ingredients, through: :pantries
end
