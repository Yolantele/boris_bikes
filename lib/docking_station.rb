
class DockingStation
  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    chosen = @bikes.select{|b| b[:broken] == false}.pop
    @bikes.delete(chosen)
    chosen
  end

  def dock(bike, broken=false)
    fail 'The docking station is full' if full?
    @bikes << {bikes: bike, broken: broken}
  end

  private

  def full?
    @bikes.count >= @capacity ? true : false
  end

  def empty?
    @bikes.empty? ? true : false
  end

end
