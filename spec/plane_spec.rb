require 'plane'

describe Plane do
  before(:each) do
    @plane = Plane.new
  end

  describe "#landed" do
    it 'can land a plane' do
      @plane.takeoff
      @plane.landed
      expect(@plane.flying).to eq(true)
    end

    it 'raises an error if plane already in air' do
      expect {@plane.landed}.to raise_error "Plane Already Landed"
    end
  end

  describe "#takeoff" do
    it 'can takeoff a plane' do
      @plane.takeoff
      expect(@plane.flying).to eq(false)
    end

    it 'raises an error if plane already taken off' do
      @plane.takeoff
      expect {@plane.takeoff}.to raise_error "Plane Already In Air"
    end
  end
end
