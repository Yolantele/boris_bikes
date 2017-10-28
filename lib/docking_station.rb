


class DockingStation
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def dock(bike)
    fail 'Docking station is full' if full?
    @bikes << bike
  end


  def release_bike
    fail 'No bikes available' if empty?
    chosen = @bikes.each do |b|
      unless b.broken?
        @bikes.pop
      else
      fail 'No bikes available'
      end
    end
    @bikes.delete(chosen)
    chosen
  end

  private

  attr_reader :bikes

  def full?
    bikes.count >= capacity #? true : false
  end

  def empty?
    bikes.empty? #true : false
  end

end
