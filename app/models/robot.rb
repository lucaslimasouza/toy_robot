# frozen_string_literal: true

class Robot
  def initialize(coordinate, orientation, tabletop)
    @coordinate = coordinate
    @orientation = orientation
    @tabletop = tabletop
  end

  def play(command)
    send(command.downcase)
  end

  def left
    @orientation = @orientation.to_left
  end

  def report
    "#{@coordinate.report},#{@orientation.report}"
  end

  private

  def move
    @coordinate = @orientation.move(
      @coordinate.x,
      @coordinate.y,
      @tabletop.unit_grid
    )
  end
end
