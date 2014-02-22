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

  context "#hello" do
    it "returns hello" do
      rover2.hello.should eq('hello')
    end
  end

end
