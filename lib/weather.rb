class Weather

  attr_reader :stormy

  def initialize
    @stormy
  end

  def weather_generator
    rand(1..10) > 7 ? @stormy = true : @stormy = false
  end

end
