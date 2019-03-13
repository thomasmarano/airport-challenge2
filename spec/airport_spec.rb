require 'airport'
require 'plane'
require 'weather'


describe Airport do
  before(:each) do

    @weather = double("weather")
    @airport = Airport.new(@weather)
    @airport = Airport.new(@weather)
    @plane = double("plane")


    allow(@plane).to receive(:landed)
    allow(@plane).to receive(:takeoff)

  end

  it "instantiates with an empty hangar" do
    expect(@airport.planes.length).to eq(0)
    expect(@airport.planes).to be_kind_of(Array)
  end

  describe '#land' do

    it "can land a plane at the airport" do
      allow(@weather).to receive(:stormy).and_return(false)
      @airport.land(@plane)
      expect(@airport.planes).to include(@plane)
    end

    it 'raises an error if weather is stormy' do
      allow(@weather).to receive(:stormy).and_return(true)
      expect{ @airport.land(@plane) }.to raise_error "Stormy Weather"
    end

    it 'cannot land a plane if capacity is full' do
      allow(@weather).to receive(:stormy).and_return(false)
      Airport::CAPACITY.times {@airport.land(@plane)}
      expect{@airport.land(@plane)}.to raise_error "Capacity Full"
    end

  end

  describe '#takeoff' do
    it "can takeoff a plane from the airport" do
      allow(@weather).to receive(:stormy).and_return(false)
      @airport.land(@plane)
      @airport.takeoff(@plane)
      expect(@airport.planes).not_to include(@plane)
    end

    it 'raises an error if weather is stormy' do
      allow(@weather).to receive(:stormy).and_return(true)
      expect { @airport.takeoff(@plane) }.to raise_error "Stormy Weather"

    end
  end
end
