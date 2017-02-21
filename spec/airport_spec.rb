describe Airport do

  it "should respond to land method with an argument" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "should respond to take_off method" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

end
