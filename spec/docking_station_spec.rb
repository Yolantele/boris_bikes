require 'docking_station'
require 'bike'

class Bike
  def working?
    true
  end
end

describe DockingStation do

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      # we want to release the bike we docked
      expect{subject.release_bike}.to raise_error 'No bikes available'
    end

    it 'only returns non-broken bikes' do
      subject.dock(Bike.new)
      subject.dock(Bike.new, true)
      expect(subject.release_bike).to include(:broken => false)
    end
  end

  describe "#dock(bike)" do
    it "raises error when the station can no accept bikes" do

      expect{21.times {subject.dock(Bike.new)}}.to raise_error "The docking station is full"
    end

    it "user passing bike as broken" do
      expect(subject).to respond_to(:dock).with(2).arguments
    end

  end

end
