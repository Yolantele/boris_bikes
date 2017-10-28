require_relative 'bike'
require_relative 'bike_container'

class Garage
  include BikeContainer

  def accept(bike)
    bike.fix
    add_bike bike
  end

end
