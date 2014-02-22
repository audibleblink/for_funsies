require_relative '../lib/grid'

describe Grid do

  let!(:grid) { Grid.new(5,5) }

  context "#sitrep" do
    it "should report the grid boundaires" do
      grid.sitrep.should eq({ max_x: 5, max_y: 5, min_x: 0, min_y: 0 })
    end
  end

end
