require "spec_helper"

describe Parser do

  context "#fetch_communication" do
    
    it "should return a valid hash" do
      Parser.fetch_communication.should eq({
        :grid_size=>{:x=>5, :y=>5}, 
        :rover1=>{
          :start_position=>{:direction=>"N", :coords=>[1, 2]}, :commands=>"LMLMLMLMM"
        }, 
        :rover2=>{
          :start_position=>{:direction=>"E", :coords=>[3, 3]}, :commands=>"MMRMMRMRRM"
        }
      })
    end

  end
  
end

describe Houston do
  context "#sitrep" do

    let!(:rover) { Rover.new({coords: [5,5], direction: "N"}) }
    let!(:sensor) { Sensor.new(Grid.new( x:5, y:5 )) }
    it "should detect if directives would cause the drone to fall" do
      expect { Houston.sitrep(rover, "M") }.to raise_error
    end
  end
end
