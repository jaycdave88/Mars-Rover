require_relative 'Coordinates.rb'

class Plateau
	attr_reader :boundry_coordinates
	def initialize(x, y)
		@boundry_coordinates = Coordinates.new(x,y)
	end
end