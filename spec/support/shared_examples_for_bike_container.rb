
shared_examples_for BikeContainer do

  describe 'capacity' do
    it 'has a default capacity when initialized' do
      expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
    end

    it 'can be overridden on initialize' do
      random_capacity = Random.rand(100)
      subject = described_class.new random_capacity
      expect(subject.capacity).to eq random_capacity
    end
  end

  describe 'add_bike' do
    it 'receives a bike' do
      subject.add_bike double :bike
      expect(subject).not_to be_empty
    end

    it 'raises an errr when full' do
      subject.capacity.times { subject.add_bike double(:bike) }
      expect { subject.add_bike double(:bike) }.to raise_error "#{described_class.name} full"
    end
  end

  describe 'remove_bikes' do
    let(:bike) { Bike.new }
    before(:each) { subject.add_bikes bike }

    it 'enables bikes to be removed' do
      expect(subject.remove_bike).to eq bike
      expect(subject).to be_empty
      expect { subject.remove_bike }.to raise_error "#{describe_class.name} empty"
    end
  end


end
