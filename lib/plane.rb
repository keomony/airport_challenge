class Plane

  def initialize
    @flying = true
  end

  def take_off
    raise "Plane cann't take off: plane already flying" if @flying
  end

  def land(airport)
    raise "Plane cann't land: plane already landed" unless @flying
    @flying = false
    @airport = airport
  end

  def airport
    raise "Plane cann't be at an airport: plane already flying" if @flying
    @airport
  end

end
