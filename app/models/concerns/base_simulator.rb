# frozen_string_literal: true

module BaseSimulator
  AXIS_X = 5
  AXIS_Y = 5
  UNIT_GRID = 1

  include Compass

  def simulate
    report = ''
    begin
      default_commands.each do |line|
        if line.include?('PLACE')
          @robot = get_robot(line.delete("\n"))
        elsif @robot
          report = @robot.play(line.delete("\n").strip)
        end
      end
    rescue Exception => e
      puts "Error on play the Robot => #{e}"
    end
    report
  end

  protected

  def get_robot(line)
    commands = get_commands(line)
    coordinate = new_coordinate(commands)
    orientation = compass_pointer(commands.last)
    if coordinate.valid? && @tabletop.valid?
      Robot.new(coordinate, orientation, @tabletop)
    end
  end

  def get_commands(line)
    line.split(' ').last.split(',')
  end

  def new_coordinate(commands)
    Coordinate.new(x: commands[0].to_i, y: commands[1].to_i)
  end
end
