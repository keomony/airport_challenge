require './lib/airport'

describe Airport do

  it "should respond to land method with an argument" do
    expect(subject).to respond_to(:land).with(1).argument
  end

end
