class Airport

  attr_reader :planes
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def park_plane(plane)
  @planes << plane 
  end

  def unpark_plane(plane)
    @planes -= [plane]
  end

end
