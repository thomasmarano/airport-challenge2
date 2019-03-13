class Plane

  attr_reader :flying

  def initialize
    @flying = true
  end

  def landed
    raise "Plane Already Landed" if @flying
    @flying = true
  end

  def takeoff
    raise "Plane Already In Air" if !@flying
    @flying = false
  end

end
