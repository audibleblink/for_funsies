class Grid

  def initialize(x, y, a=0, b=0)
    @max_x = x
    @max_y = y
    @min_x = a
    @min_y = b
  end

  def sitrep
    { max_x: @max_x, max_y: @max_y, min_x: @min_x, min_y: @min_y }
  end

end
