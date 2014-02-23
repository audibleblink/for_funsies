require "spec_helper"

describe Rover do

  let!(:rover1) { Rover.new({coords: [1,2], direction: "N" }) }
  let!(:rover2) { Rover.new({coords: [3,3], direction: "e" }) }


  context "#initialize" do
    it "should only allow cardinal directions for the 2nd parameter" do
      expect { test = Rover.new [1,1], "p" }.to raise_error
    end

    it "should take a tuple as coordinates" do
      expect { test = Rover.new [1,2,3], "n" }.to raise_error
    end

    it "should take an array" do
      expect { test = Rover.new 5, "n" }.to raise_error
    end

  end

  context "#move" do
    it "should only accept the letters LRM as input" do
      expect { rover1.move("LMX") }.to raise_error
    end
    
    it "should report the correct coordinates" do
      rover1.move("LMLMLMLMM").should eq('1 3 N')
    end  

    it "should report the correct coordinates" do
      rover2.move("MMRMMRMRRM").should eq('5 1 E')
    end  
  end  

  context "#turn" do
    it "should turn the rover to the appropriate direction" do
      rover1.move("L")
      rover1.direction.should eq("W")
    end

    it "should turn the rover to the appropriate direction" do
      rover2.move("R")
      rover2.direction.should eq("S")
    end    
  end

end


