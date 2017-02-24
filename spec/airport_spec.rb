describe Airport do

  subject(:airport) { described_class.new(10, weather_reporter_klass) }
  let(:plane) {double(:Plane)}
  let(:weather_reporter_klass) { double(:WeatherReporter) }

  it "should respond to land method with an argument" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it "should respond to take_off method" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  context "when stormy" do

    it "raises an error if asked to take off the plane" do
      allow(weather_reporter_klass).to receive(:stormy?).and_return(true)
      expect{airport.take_off(plane)}.to raise_error "Cann't take off plane: weather is stormy"
    end
    it "raises an error if instructed to land the plane" do
      allow(weather_reporter_klass).to receive(:stormy?).and_return(true)
      expect{airport.land(plane)}.to raise_error "Cann't land plane: weather is stormy"
    end

  end

  context "when not stormy" do

    it "instructs a plane to take off" do
      allow(weather_reporter_klass).to receive(:stormy?).and_return(false)
      expect{airport.take_off(plane)}.not_to raise_error
    end
    it "instructs a plane to land" do
      allow(weather_reporter_klass).to receive(:stormy?).and_return(false)
      expect{airport.land(plane)}.not_to raise_error
    end

  end

  context "when it's full" do

    it "raises an error if instructed to land the plane" do
      allow(weather_reporter_klass).to receive(:stormy?).and_return(false)
      10.times do
        airport.land(plane)
      end
      expect{airport.land(plane)}.to raise_error "Cann't land plane: airport is full"
    end

  end

end
