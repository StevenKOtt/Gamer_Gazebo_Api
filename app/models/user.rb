class User < ApplicationRecord
    has_secure_password
    has_many :game_cards
    validates :username, uniqueness: {case_sensitive: false}
end
