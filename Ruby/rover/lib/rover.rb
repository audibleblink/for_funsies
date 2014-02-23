class Sensor

  def initialize grid
    @grid = grid
  end

  def out_of_bounds? rover
    if rover.coordinates[0] > @grid.max_x
      return true
    elsif rover.coordinates[1] > @grid.max_y
      return true
    else
      return false
    end
  end

end


class Rover

  attr_reader :coordinates, :direction


  def initialize object
    raise ArgumentError, 'Face me N, S, E, or W' unless object[:direction].upcase.match(/[^NEWS]/).nil?  
    raise ArgumentError, 'Coordinates must be give in [x,y]' unless object[:coords].class == Array && object[:coords].length == 2
    @coordinates = object[:coords]
    @direction   = object[:direction].upcase
  end

  def move directives
    raise ArgumentError, 'I only accept the directives L, R, M' unless directives.upcase.match(/[^LRM]/).nil?  
    dirs = directives.upcase.split('')

    while dirs[0]

      case dirs.shift
      when "L"
        turn "L"
      when "R"
        turn "R"
      when "M" 
        if    (@direction == "N")
          @coordinates[1] += 1
        elsif (@direction == "E")
          @coordinates[0] += 1
        elsif (@direction == "S")
          @coordinates[1] -= 1
        elsif (@direction == "W")
          @coordinates[0] -= 1                        
        end
      end
    end
    report
  end


  def report
    "#{@coordinates[0]} #{@coordinates[1]} #{@direction.upcase}"
  end


private 

  def turn dir
    left_turn  = { N: 'W', E: 'N', S: 'E', W: 'S' }
    right_turn = { N: 'E', E: 'S', S: 'W', W: 'N' }

    case dir
    when "L"
      @direction = left_turn[@direction.to_sym]
    when "R"
      @direction = right_turn[@direction.to_sym]
    end
  end


end



