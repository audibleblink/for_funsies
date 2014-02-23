require "rover"
require "grid"

class Houston

  def self.liftoff
    @comms  = Parser.fetch_communication
    @grid  = Grid.new( @comms[:grid_size] )
    @rover1 = Rover.new( @comms[:rover1][:start_position] )
    @rover2 = Rover.new( @comms[:rover2][:start_position] )
  end

  def self.move!
    p @rover1.move(@comms[:rover1][:commands])
    p @rover2.move(@comms[:rover2][:commands])
  end


end




class Parser


  def self.fetch_communication
    @document = File.open("directives.txt", 'r')
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
