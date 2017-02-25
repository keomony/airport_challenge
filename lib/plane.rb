class Plane

  def initialize
    @flying = true
  end

  def take_off
    raise "Plane cann't take off: plane already flying"
  end

  def land
    raise "Plane cann't land: plane already landed" unless @flying
    @flying = false
  end

  def airport
    raise "Plane cann't be at an airport: plane already flying"
  end

end
