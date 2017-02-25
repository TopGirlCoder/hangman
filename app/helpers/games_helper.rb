require 'net/http'
require 'uri'
require 'json'


module GamesHelper
	def self.search_words(params)
		# minLength = params["minimum_length"]
		# word = "hello"
		uri = URI.parse('http://linkedin-reach.hagbpyjegb.us-west-2.elasticbeanstalk.com/words')
		response = Net::HTTP.get_response(uri)
		# json_obj = JSON.parse(response.body)
		# json_obj.class
		word = response.body.lines
		word.sample.chomp("\n")
	end	

end
