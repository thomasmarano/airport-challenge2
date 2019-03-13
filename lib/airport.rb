require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  attr_reader :planes

  def initialize(weather = Weather.new)
    @weather = weather
    @planes = []
  end

  def land(plane)
    raise "Stormy Weather" if @weather.stormy
    @planes.push(plane)
  end

  def takeoff(plane)
    raise "Stormy Weather" if @weather.stormy
    @planes.delete(plane)
  end


end
