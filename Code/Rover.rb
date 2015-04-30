require_relative '../Code/Coordinates.rb'
require_relative '../Code/Plateau.rb'

class Rover
	attr_accessor :position, :direction
	def initialize(params,plateau)
		@position = Coordinates.new(params[0], params[1])
		@direction = params[2]
		@commands = %w(N E S W)
		@plateau = plateau
	end

	def give_commands(commands)
		commands = commands
		commands.each {|direction| send(direction)}
	end

	private

	def R
		case @direction
		when "N" then @direction = "E"
		when "E" then @direction = "S"
		when "S" then @direction = "W"
		when "W" then @direction = "N"
		end
	end

	def L
		case @direction
		when "N" then @direction = "W"
		when "E" then @direction = "N"
		when "S" then @direction = "E"
		when "W" then @direction = "S"
		end
	end

	def M
		case @direction
		when "N"
			@new_y_axis = @position.y_axis + 1
			if not_on_boundary(@new_y_axis, @plateau.boundry_coordinates.y_axis)
				@position.y_axis = @new_y_axis
			end
		when "E"
			@new_x_axis = @position.x_axis + 1
			if not_on_boundary(@new_x_axis, @plateau.boundry_coordinates.x_axis)
				@position.x_axis = @new_x_axis
			end
		when "S"
			@new_y_axis = @position.y_axis - 1
			if not_on_boundary(@new_y_axis, @plateau.boundry_coordinates.y_axis)
				@position.y_axis = @new_y_axis
			end
		when "W"
			@new_x_axis = @position.x_axis - 1
			if not_on_boundary(@new_x_axis, @plateau.boundry_coordinates.x_axis)
				@position.x_axis = @new_x_axis
			end
		end
	end

	def not_on_boundary(axis, boundary)
		return axis <= boundary && axis >= 0
	end
end