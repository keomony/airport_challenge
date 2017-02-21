class Airport

  def land(plane)
  end

  def take_off(plane)
    raise "Cann't take off plane: weather is stormy" if stormy?
  end

  def stormy?
    rand_number = rand(10)
    if rand_number < 2
      return true
    else
      return false
    end
  end

end
