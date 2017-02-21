class Airport

  def land(plane)
  end

  def take_off(plane)
    raise "Cann't take off plane: weather is stormy" if stormy?
  end

  private
  def stormy?
    rand(10) < 2
  end

end
