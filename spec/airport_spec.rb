describe Airport do
  subject(:airport) { described_class.new }

  it "should respond to land method with an argument" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it "should respond to take_off method" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  context "when it's stormy" do
    it "raises an error if asked to take off the plane" do
      plane = double(:Plane)
      allow(airport).to receive(:stormy?).and_return(true)
      expect{airport.take_off(plane)}.to raise_error "Cann't take off plane: weather is stormy"
    end
  end

end
