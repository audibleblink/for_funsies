class Grid

  attr_reader :max_x, :max_y
  def initialize(obj, a=0, b=0)
    @max_x, @max_y = obj[:x], obj[:y]
    @min_x, @min_y = a, b
  end

  def sitrep
    { max_x: @max_x, max_y: @max_y, 
      min_x: @min_x, min_y: @min_y }
  end

end
