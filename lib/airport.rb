require_relative 'weather_reporter'

class Airport
  DEFAULT_CAPACITY = 10
  def initialize(weather_reporter_klass, capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @weather_reporter = weather_reporter_klass
    @planes = []
  end

  def land(plane)
    raise "Cann't land plane: weather is stormy" if stormy?
    raise "Cann't land plane: airport full" if full?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    raise "Cann't take off plane: weather is stormy" if stormy?
    raise "Cann't take off plane: plane not at this airport" unless at_airport?(plane)
    plane
  end

  private
  def stormy?
    @weather_reporter.stormy?
  end

  def full?
    @capacity <= @planes.length
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end
end
