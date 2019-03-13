require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  attr_reader :planes

  CAPACITY = 10

  def initialize(weather = Weather.new)
    @weather = weather
    @planes = []
  end

  def land(plane)
    raise "Stormy Weather" if stormy?
    raise "Capacity Full" if airport_full?

    plane.landed
    @planes.push(plane)
  end

  def takeoff(plane)
    raise "Stormy Weather" if stormy?
    plane.takeoff
    @planes.delete(plane)
  end

  private

  def stormy?
    !!@weather.stormy
  end

  def airport_full?
    @planes.length >= CAPACITY
  end

end
