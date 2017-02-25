class Guess < ApplicationRecord
	DEFAULT_LETTERS = 'a'..'z'
	belongs_to :game
end
