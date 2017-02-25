class User < ApplicationRecord
	has_secure_password
	has_many :games
	has_many :guesses, through: :games
	validates :username, :email, :password, presence: true
end
