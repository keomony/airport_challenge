class Plane

  def initialize
    @flying = true
  end

  def take_off
    raise "Plane cann't take off: plane already flying" if flying
  end

  def land(airport)
    raise "Plane cann't land: plane already landed" if landed
    @flying = false
    @airport = airport
  end

  def airport
    raise "Plane cann't be at an airport: plane already flying" if flying
    @airport
  end

  private
  attr_reader :flying

  def landed
    !flying
  end

end
