require 'docking_station'
 # require 'bike'
describe DockingStation do

    class BikeDouble
      def working?
        true
      end
    end

  describe 'initialization' do
    subject {DockingStation.new}
    let(:bikes) { BikeDouble.new }
    it 'sets default capacities' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bikes)
      end
      expect { subject.dock(bikes) }.to raise_error 'Docking station is full'
    end
  end

  it { is_expected.to respond_to :release_bike }

    it 'releases working bikes' do
      subject.dock BikeDouble.new
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it 'does not release broken bikes' do
      bike = BikeDouble.new
      bike.report_broken
      subject.dock bike
      expect(subject.release_bike).to raise_error 'No bikes available'
    end

  it { is_expected.to respond_to(:dock).with(1).argument }

    describe '#release_bike' do
      it 'raises an error when there are no bikes available' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end
    end

  describe 'dock' do
    it 'raises error when full' do
      subject.DEFAULT_CAPACITY.times { subject.dock(BikeDouble.new) }
      expect{ subject.dock(BikeDouble.new) }.to raise_error 'Docking station is full'
    end
  end

  #   it "user passing bike as broken" do
  #     expect(subject).to respond_to(:dock).with(2).arguments
  #   end
end
