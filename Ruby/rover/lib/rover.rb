class Rover

  attr_reader :coordinates, :direction


  def initialize coords, direction
    @coordinates = coords
    @direction   = direction.upcase
  end

  def move directives
    raise ArgumentError, 'I only accept the directives L, R, M' unless directives.upcase.match(/[^LRM]/).nil?  
    
    report
  end

  def turn dir
    left_turn  = {N: 'W', E: 'N', S: 'E', W: 'S' }
    right_turn = {N: 'E', E: 'S', S: 'W', W: 'N' }

    case dir
    when "L"
      @direction = left_turn[@direction.to_sym]
    when "R"
      @direction = right_turn[@direction.to_sym]
    end
  end

  def report
    "#{@coordinates[0]} #{@coordinates[1]} #{@direction.upcase}"
  end

end



