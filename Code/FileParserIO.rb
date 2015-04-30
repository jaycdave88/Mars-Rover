require_relative 'Plateau.rb'

class FileIO
	attr_reader :rover_directions, :plateau
	def initialize
		@file = '../mars_rover_mission.txt'
		@rover_directions = []
	end

	def read_file
		if !File.exist?(@file)
			puts "File not found."
		else
			File.open(@file) do |file|
				file.readlines.each_with_index do |line, idx|
					if idx ==0
						boundary = line.chomp.split(" ")
						@plateau =  Plateau.new(boundary[0], boundary[1])
					elsif idx %2 !=0
						@rover_directions[(idx-1)/2] = {}
						@rover_directions[(idx-1)/2][:start] = line.chomp.split(" ")
					else
						@rover_directions[(idx-1)/2][:directions] = line.chomp.split("")
					end
				end
			end
		end
		return @plateau
	end

	def write_file(rover, bounds)
		aFile = File.open("../Mars_Rover.txt","a")
		aFile.puts("#{rover.position.x_axis} #{rover.position.y_axis} #{rover.direction}")
		aFile.close
	end
end