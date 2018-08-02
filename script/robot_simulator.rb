# frozen_string_literal: true

class RobotSimulator
  AXIS_X = 5
  AXIS_Y = 5
  UNIT_GRID = 1

  include Compass

  def initialize(path_file)
    @path_file = path_file
    @tabletop = Tabletop.new(axisX: AXIS_X, axisY: AXIS_Y, unit_grid: UNIT_GRID)
  end

  def simulate
    File.readlines(@path_file).each do |line|
      if line.include?('PLACE')
        @robot = get_robot(line.delete("\n"))
      elsif @robot
        report = @robot.play(line.delete("\n"))
        print(report)
      end
    end
  end

  private

  def get_robot(line)
    commands = get_commands(line)
    coordinate = new_coordinate(commands)
    orientation = compass_pointer(commands.last)
    Robot.new(coordinate, orientation, @tabletop) if coordinate.valid? && @tabletop.valid?
  end

  def get_commands(line)
    line.split(' ').last.split(',')
  end

  def new_coordinate(commands)
    Coordinate.new(x: commands[0].to_i, y: commands[1].to_i)
  end

  def print(report)
    p report if report.is_a? String
  end
end

simulator = RobotSimulator.new('script/commands.txt')
simulator.simulate
