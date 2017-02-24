describe "user stories" do

  let(:airport) { Airport.new(10) }
  let(:plane) { Plane.new }

  context "when weather is not stormy" do
    before do
      allow(airport).to receive(:stormy?).and_return(false)
    end
    # As an air traffic controller
    # So I can get passengers to a destination
    # I want to instruct a plane to land at an airport and confirm that it has landed
    it "so planes land at the airports, instruct a plane to land" do
      expect{ airport.land(plane) }.not_to raise_error
    end

    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it "so planes take off from the airport, instruct a plane to take off" do
      expect{ airport.take_off(plane) }.not_to raise_error
    end


  end

  context "when weather is stormy" do
    before do
      allow(airport).to receive(:stormy?).and_return(true)
    end

    # As an air traffic controller
    # To ensure safety
    # I want to prevent takeoff when weather is stormy
    it "prevent planes to take off" do
      expect{ airport.take_off(plane) }.to raise_error "Cann't take off plane: weather is stormy"
    end

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when weather is stormy
    it "prevent planes to land" do
      expect{ airport.land(plane) }.to raise_error "Cann't land plane: weather is stormy"
    end

  end

  context "when the airport is full" do
    before do
      allow(airport).to receive(:stormy?).and_return(false)
    end
    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when the airport is full
    it "prevent planes to land" do
      10.times do
        airport.land(plane)
      end
      expect{airport.land(plane)}.to raise_error "Cann't land plane: airport is full"
    end

  end


end
