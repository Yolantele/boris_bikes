require 'docking_station'

describe DockingStation do

  class BikeDouble

      def broken?
        true
      end

      def report_broken
      end
    end

  bike = BikeDouble.new

  describe 'initialization' do
    subject { DockingStation.new }
    it 'sets default capacities' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike) }.to raise_error 'Docking station is full'
    end
  end

  it { is_expected.to respond_to :release_bike }

    it 'releases working bikes' do
      bike (broken?: false)
      subject.dock(bike)
      expect(subject.release_bike).to be bike
    end

    it 'does not release broken bikes' do
      allow(bike).to receive(:broken).and_return(true)
      subject.dock bike
      expect(subject.release_bike).to raise_error 'No bikes available'
    end

  it { is_expected.to respond_to(:dock).with(1).argument }

    describe ' #release_bike' do
      it 'raises an error when there are no bikes available' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end
    end

  describe 'dock' do
    it 'raises error when full' do
      subject.capacity.times { subject.dock(bike) }
      expect{ subject.dock(bike) }.to raise_error 'Docking station is full'
    end
  end

end
