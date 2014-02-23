require_relative "./rover"
require_relative "./grid"

class Houston

  def self.liftoff
    @comms  = Parser.fetch_communication
    @sensor = Sensor.new(Grid.new( @comms[:grid_size] ))
    @rover1 = Rover.new( @comms[:rover1][:start_position] )
    @rover2 = Rover.new( @comms[:rover2][:start_position] )

  end

  def self.move!
    sitrep @rover1, @comms[:rover1][:commands]
    puts @rover1.move(@comms[:rover1][:commands])
    sitrep @rover2, @comms[:rover2][:commands]
    puts @rover2.move(@comms[:rover2][:commands])
  end

  def self.sitrep rover, directives
    coords, dir = rover.coordinates, rover.direction
    phantom = Rover.new({coords: coords, direction: dir})
    phantom.move(directives)
    raise ArgumentError, 'These directives would drive the rover over the edge of the plateau' if @sensor.out_of_bounds? phantom
  end

end


class Parser

  def self.fetch_communication
    @document = File.open(Dir[File.expand_path(File.join(File.dirname(__FILE__), '../directives.txt'))][0], 'r')
    comms = {
      grid_size: grid_size,
      rover1: { start_position: start_position, commands: commands },
      rover2: { start_position: start_position, commands: commands }
    }
  end


private

  def self.grid_size
    size = {}
    info = @document.first.strip.split(' ').map(&:to_i)
    size[:x] = info[0]
    size[:y] = info[1]
    size
  end

  def self.start_position
    position = {}
    info = @document.first.strip.split(' ')
    position[:direction] = info.pop
    position[:coords]    = info.map(&:to_i)
    position
  end

  def self.commands
    @document.first.strip
  end


end

Houston.liftoff
Houston.move!
