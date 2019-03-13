require 'weather'

describe Weather do
  before(:each) do
    @weather = Weather.new

  end

  describe '#weather_generator' do
    it 'generates random weather' do
      @weather.weather_generator
      expect(@weather.stormy).to eq(true).or eq(false)
    end
  end

end
