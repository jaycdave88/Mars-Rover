class Coordinates
	attr_accessor :x_axis, :y_axis
	def initialize(x,y)
		@x_axis = x.to_i
		@y_axis = y.to_i
	end
end