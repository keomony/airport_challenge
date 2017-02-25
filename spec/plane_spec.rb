describe Plane do

  subject(:plane) {described_class.new}

  describe "#take_off" do
    it{is_expected.to respond_to(:take_off)}
    it "raises an error if already flying" do
      expect{plane.take_off}.to raise_error "Plane cann't take off: plane already flying"
    end
  end

  describe "#land" do
    it { is_expected.to respond_to(:land)}
    it "raises an error if already landed" do
      plane.land
      expect{plane.land}.to raise_error "Plane cann't land: plane already landed"
    end
  end


  describe "#airport" do
    it { is_expected.to respond_to(:airport)}
    it "raises an error when already flying" do
      expect{plane.airport}.to raise_error "Plane cann't be at an airport: plane already flying"
    end
  end



end
