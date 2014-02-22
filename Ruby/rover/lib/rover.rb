class Rover


  def initialize coords, direction
    @coordinates = coords
    @direction   = direction
  end

  def move directives
    raise ArgumentError, 'I only accept the directives L, R, M' unless directives.upcase.match(/[^LRM]/).nil?  
    report
  end

  def hello
    "hello"
  end

  def report
    "#{@coordinates[0]} #{@coordinates[1]} #{@direction.upcase}"
  end

end
