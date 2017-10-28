require './lib/bike.rb'

class Vans

  @garage = []
  @docks = []

  def bike
  end

  def broken
  end

  def to_garage
    @garage << bike.broken
  end

  def for_distribution
    @docks << bike
  end

end
