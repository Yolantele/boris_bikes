require 'vans'

describe Vans do

  class BikeDouble
    def broken
      true
    end
  end

  describe ' to garages ' do

    it 'take in broken bikes' do
      bike = BikeDouble.new
      bike.broken
      expect(subject.to_garage).to inlcude(bike.broken)
    end
  end

  describe 'for distribution' do

    it 'take in working bikes' do
      bike = BikeDouble.new
      expect(subject.for_distribution).to include(bike)
    end
  end

end
