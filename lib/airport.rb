class Airport

  def initialize
    @capacity = 0
  end

  def land(plane)
    raise "Cann't land plane: weather is stormy" if stormy?
    raise "Cann't land plane: airport is full" if @capacity >= 10
    @capacity += 1
  end

  def take_off(plane)
    raise "Cann't take off plane: weather is stormy" if stormy?
  end

  private
  def stormy?
    rand(10) < 2
  end

end
