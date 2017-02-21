class Airport

  def initialize(capacity)
    @capacity = capacity
    @number_of_planes = 0
  end

  def land(plane)
    raise "Cann't land plane: weather is stormy" if stormy?
    raise "Cann't land plane: airport is full" if full?
    @number_of_planes += 1
  end

  def take_off(plane)
    raise "Cann't take off plane: weather is stormy" if stormy?
  end

  private
  def stormy?
    rand(10) < 2
  end

  def full?
    @number_of_planes >= @capacity
  end

end
