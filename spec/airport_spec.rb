require 'airport'
require 'plane'
require 'weather'


describe Airport do
  before(:each) do

    @weather = double("weather")
    @clear_airport = Airport.new(@weather)
    @stormy_airport = Airport.new(@weather)
    @plane = double("plane")

  end

  it "instantiates with an empty hangar" do
    expect(@clear_airport.planes.length).to eq(0)
    expect(@clear_airport.planes).to be_kind_of(Array)
  end

  describe '#land' do

    it "can land a plane at the airport" do
      allow(@weather).to receive(:stormy).and_return(false)
      @clear_airport.land(@plane)
      expect(@clear_airport.planes).to include(@plane)
    end

    it 'raises an error if weather is stormy' do
      allow(@weather).to receive(:stormy).and_return(true)
      expect{ @stormy_airport.land(@plane) }.to raise_error "Stormy Weather"
    end
  end

  describe '#takeoff' do
    it "can takeoff a plane from the airport" do
      allow(@weather).to receive(:stormy).and_return(false)
      @clear_airport.land(@plane)
      @clear_airport.takeoff(@plane)
      expect(@clear_airport.planes).not_to include(@plane)
    end

    it 'raises an error if weather is stormy' do
      allow(@weather).to receive(:stormy).and_return(true)
      expect { @stormy_airport.takeoff(@plane) }.to raise_error "Stormy Weather"

    end
  end
end
