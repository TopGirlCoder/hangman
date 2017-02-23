class Game < ApplicationRecord
	DEFAULT_MAX_LIVES = 6

	belongs_to :user
	# has_many :guesses, dependent: :destroy
	
	after_update :update_total_score
	
	# Use the API in helper to get a word: GamesHelper.search_words(@game)

	def max_lives?
		remaining_lives == 0 
	end	

	def remaining_lives
		DEFAULT_MAX_LIVES - guesses.where(correct?: false).count
	end	

	def word_to_letters
		word.chars.uniq.sort
		# letters = {}
		# word.chars.each { |letter| letters[letter] = 1 }
		# letters	
	end	

	def guessed_letters
		guesses.where(correct?: true).pluck(:letter).sort
		# letters = {}
		# guesses.where(correct?: true).pluck(:letter).each { |letter| letters[letter] = 1 }
		# letters
	end	

	def incorrect_guessed_letters
		guesses.where(correct?: false).pluck(:letter)
	end	

	def update_score
		won? ? self.update(score: word.length) : self.update(score: 0)
	end	

	def update_total_score
		self.user.update(total_score: user.games.sum(:score))
	end	

	def won?
		guessed_letters == word_to_letters
	end

	def lost?
		!won && max_lives?
	end	

	def game_over?
		max_lives? || won? ? true : false	
	end		
end
