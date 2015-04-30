require 'rspec'
require_relative "../Code/Rover.rb"
require_relative "../Code/Plateau.rb"

describe ".R" do
	plateau = Plateau.new(5,5)
	it "should return E when starting at N" do
		rover = Rover.new([1,1,"N"],plateau)
		rover.give_commands(["R"])
		expect(rover.direction()).to eq("E")
	end

	it "should return S when starting at E" do
		rover = Rover.new([1,1,"E"],plateau)
		rover.give_commands(["R"])
		expect(rover.direction()).to eq("S")
	end

	it "should return W when starting at S" do
		rover = Rover.new([1,1,"S"],plateau)
		rover.give_commands(["R"])
		expect(rover.direction()).to eq("W")
	end

	it "should return N when starting at W" do
		rover = Rover.new([1,1,"W"],plateau)
		rover.give_commands(["R"])
		expect(rover.direction()).to eq("N")
	end
end

describe ".L" do
	plateau = Plateau.new(5,5)
	it "should return W when starting at N " do
		rover = Rover.new([1,1,"N"],plateau)
		rover.give_commands(["L"])
		expect(rover.direction()).to eq("W")
	end
	it "should return N when starting at E" do
		rover = Rover.new([1,1,"E"],plateau)
		rover.give_commands(["L"])
		expect(rover.direction()).to eq("N")
	end
	it "should return E when starting at S" do
		rover = Rover.new([1,1,"S"],plateau)
		rover.give_commands(["L"])
		expect(rover.direction()).to eq("E")
	end
	it "should return S when starting at W" do
		rover = Rover.new([1,1,"W"],plateau)
		rover.give_commands(["L"])
		expect(rover.direction()).to eq("S")
	end
end

describe ".M" do
	plateau = Plateau.new(5,5)
	it "should move up" do
		rover = Rover.new([2,2,"N"],plateau)
		rover.give_commands(["M"])
		coordinates = rover.position()
		expect(coordinates.x_axis).to eq(2)
		expect(coordinates.y_axis).to eq(3)
		expect(rover.direction()).to eq("N")
	end
	it "should move down" do
		rover = Rover.new([2,2,"S"],plateau)
		rover.give_commands(["M"])
		coordinates = rover.position()
		expect(coordinates.x_axis).to eq(2)
		expect(coordinates.y_axis).to eq(1)
		expect(rover.direction()).to eq("S")
	end
	it "should move right" do
		rover = Rover.new([2,2,"E"],plateau)
		rover.give_commands(["M"])
		coordinates = rover.position()
		expect(coordinates.x_axis).to eq(3)
		expect(coordinates.y_axis).to eq(2)
		expect(rover.direction()).to eq("E")
	end
	it "should move left" do
		rover = Rover.new([2,2,"W"],plateau)
		rover.give_commands(["M"])
		coordinates = rover.position()
		expect(coordinates.x_axis).to eq(1)
		expect(coordinates.y_axis).to eq(2)
		expect(rover.direction()).to eq("W")
	end
end

describe ".M" do
	it "should not move right if on the boundary" do
		plateau=Plateau.new(5,5)
		rover = Rover.new([5,5,"E"],plateau)
		rover.give_commands(["M"])
		coordinates = rover.position()
		expect(coordinates.x_axis).to eq(5)
		expect(coordinates.y_axis).to eq(5)
	end
	it "should not move left if on the boundary" do
		plateau=Plateau.new(5,5)
		rover = Rover.new([0,1,"W"],plateau)
		rover.give_commands(["M"])
		coordinates = rover.position()
		expect(coordinates.x_axis).to eq(0)
		expect(coordinates.y_axis).to eq(1)
	end
	it "should not move up if on boundary" do
		plateau=Plateau.new(5,5)
		rover = Rover.new([5,5,"N"],plateau)
		rover.give_commands(["M"])
		coordinates = rover.position()
		expect(coordinates.x_axis).to eq(5)
		expect(coordinates.y_axis).to eq(5)
	end
	it "should not move down if on boundary" do
		plateau=Plateau.new(5,5)
		rover = Rover.new([5,0,"S"],plateau)
		rover.give_commands(["M"])
		coordinates = rover.position()
		expect(coordinates.x_axis).to eq(5)
		expect(coordinates.y_axis).to eq(0)
	end
end