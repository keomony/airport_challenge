require_relative 'weather_reporter'

class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Cann't land plane: weather is stormy" if stormy?
    raise "Cann't land plane: airport is full" if full?
    @planes << plane
  end

  def take_off(plane)
    raise "Cann't take off plane: weather is stormy" if stormy?
  end

  private
  def stormy?
    WeatherReporter.stormy?
  end

  def full?
    @capacity <= @planes.length
  end

end
