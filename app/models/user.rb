class User < ApplicationRecord
    has_secure_password
    has_many :game_cards
    has_many :follows
    validates :username, uniqueness: {case_sensitive: false}
end
