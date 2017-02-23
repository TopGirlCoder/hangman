class User < ApplicationRecord
	has_secure_password
	has_many :games
	validates :username, :email, :password, presence: true
end
