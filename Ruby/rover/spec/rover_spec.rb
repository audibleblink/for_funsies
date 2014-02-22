require_relative '../lib/rover'

describe Rover do

  let!(:rover1) { Rover.new [1,2], "n"}
  let!(:rover2) { Rover.new [1,1], "s"}

  context "#move" do
    it "should only accept the letters LRM as input" do
      expect { rover1.move("LMX") }.to raise_error
    end
    
    it "should report the correct coordinates" do
      rover1.move("LMLMLMLMM").should eq('1 3 N')
    end  end

  context "#turn" do
    it "should turn the rover to the appropriate direction" do
      rover1.turn("L")
      rover1.direction.should eq("W")
    end
  end

end
