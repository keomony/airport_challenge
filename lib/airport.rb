require_relative 'weather_reporter'

class Airport

  def initialize(capacity, weather_reporter_klass)
    @capacity = capacity
    @weather_reporter = weather_reporter_klass
    @planes = []
  end

  def land(plane)
    raise "Cann't land plane: weather is stormy" if stormy?
    raise "Cann't land plane: airport is full" if full?
    @planes << plane
  end

  def take_off(plane)
    raise "Cann't take off plane: weather is stormy" if stormy?
    raise "Cann't take off plane: plane not at this airport" unless @planes.include?(plane)
  end

  private
  def stormy?
    @weather_reporter.stormy?
  end

  def full?
    @capacity <= @planes.length
  end

end
