# frozen_string_literal: true

class RobotSimulator
  include BaseSimulator

  def initialize(path_file)
    @path_file = path_file
    @tabletop = Tabletop.new(axisX: AXIS_X, axisY: AXIS_Y, unit_grid: UNIT_GRID)
  end

  def default_commands
    File.readlines(@path_file)
  end
end

simulator = RobotSimulator.new('script/commands.txt')
report = simulator.simulate
p report if report.is_a? String
