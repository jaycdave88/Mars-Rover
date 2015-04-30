require_relative '../Code/FileParserIO.rb'
require_relative '../Code/Rover.rb'

file_parser=FileIO.new
plateau = file_parser.read_file
file_parser.rover_directions.each do |directions|
	rover = Rover.new(directions[:start],plateau)
	rover.give_commands(directions[:directions])
	file_parser.write_file(rover,plateau)
end

