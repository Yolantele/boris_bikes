require 'bike'

describe "if bike works" do
  bike = Bike.new

  it "should say its working" do
    expect(bike).to respond_to(:working)
  end
end

describe "If bike is broken" do
bike = Bike.new
  it 'can be reported broken' do
  subject.report_broken
    expect(subject).to be_broken
  end
end
