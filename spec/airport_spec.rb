describe Airport do

  subject(:airport) { described_class.new(weather_reporter_klass, 10) }
  let(:plane) {double(:Plane)}
  let(:weather_reporter_klass) { double(:WeatherReporter) }

  it "should respond to land method with an argument" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it "should respond to take_off method" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  context "when stormy" do
    before do
      allow(weather_reporter_klass).to receive(:stormy?).and_return(true)
    end

    it "raises an error if asked to take off the plane" do
      expect{airport.take_off(plane)}.to raise_error "Cann't take off plane: weather is stormy"
    end
    it "raises an error if instructed to land the plane" do
      expect{airport.land(plane)}.to raise_error "Cann't land plane: weather is stormy"
    end

  end

  context "when not stormy" do
    before do
      allow(weather_reporter_klass).to receive(:stormy?).and_return(false)
    end

    it "instructs a plane to take off" do
      airport.land(plane)
      expect{airport.take_off(plane)}.not_to raise_error
    end
    it "returns the plane that took off" do
      airport.land(plane)
      expect(airport.take_off(plane)).to eq(plane)
    end
    it "raises an error if plane is not at the airport and tries to take off" do
      other_airport = described_class.new(weather_reporter_klass, 10)
      other_airport.land(plane)
      expect{airport.take_off(plane)}.to raise_error "Cann't take off plane: plane not at this airport"
    end

    it "instructs a plane to land" do
      expect{airport.land(plane)}.not_to raise_error
    end

  end

  context "when it's full" do

    it "raises an error if instructed to land the plane" do
      allow(weather_reporter_klass).to receive(:stormy?).and_return(false)
      10.times do
        airport.land(plane)
      end
      expect{airport.land(plane)}.to raise_error "Cann't land plane: airport full"
    end

  end

  context "defaults" do
    # subject(:default_airport) {described_class.new(weather_reporter_klass)}
    it "has a default capacity" do
      default_airport = described_class.new(weather_reporter_klass)
      allow(weather_reporter_klass).to receive(:stormy?).and_return(false)
      described_class::DEFAULT_CAPACITY.times {default_airport.land(plane)}
      expect{default_airport.land(plane)}.to raise_error "Cann't land plane: airport full"
    end

  end

end
