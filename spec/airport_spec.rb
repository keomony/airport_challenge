require 'airport'
require 'pry'

describe Airport do

  it "should respond to planes" do
    expect(subject).to respond_to :planes
  end

  context "park the plane" do

    it "should respond to park_plane method" do
      expect(subject).to respond_to :park_plane
    end

    it "should park the plane when the plane is landed" do
      plane = double(:plane)
      subject.park_plane(plane)
      expect(subject.planes).to include(plane)
    end

    it "should set airport capacity to 20 by default" do
      airport = Airport.new
      expect(airport.capacity).to eq 20
    end

    it "should be able to set airport capacity" do
      airport = Airport.new(capacity = 10)
      expect(airport.capacity).to eq 10
    end

    it "should be able to park the plane if it's not full" do
      plane1 = double(:plane)
      plane2 = double(:plane)
      airport = Airport.new(capacity = 2)
      airport.park_plane([plane1,plane2])
    end

    it "should NOT park the plane if the airport is full" do
      plane1 = double(:plane)
      plane2 = double(:plane)
      plane3 = double(:plane)
      airport = Airport.new(capacity = 2)
      airport.park_plane(plane1)
      airport.park_plane(plane2)
      expect{ airport.park_plane(plane3) }.to raise_error("The airport is full.")
    end

  end

  context "unpark the plane" do

    it "should respond to unpark_plane method" do
      expect(subject).to respond_to :unpark_plane
    end

    it "should unpark a plane when the plane is taken off " do
      plane1 = double(:plane)
      plane2 = double(:plane)
      subject.park_plane(plane1)
      subject.park_plane(plane2)
      subject.unpark_plane(plane2)
      expect(subject.planes).not_to include(plane2)
    end

  end

  it "should take off from the airport in which the plane is landed" do
    plane = double(:plane)
    airport1 = Airport.new
    airport2 = Airport.new
    airport1.park_plane(plane)
    expect{ airport2.unpark_plane(plane) }.to raise_error "No such plane in the airport."
  end

end
