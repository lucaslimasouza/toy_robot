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

  def right
    @orientation = @orientation.to_right
  end

  def report
    "#{@coordinate.report},#{@orientation.report}"
  end

  private

  def move
    new_coordinate = @orientation.move(
      @coordinate.x,
      @coordinate.y,
      @tabletop.unit_grid
    )
    @coordinate = new_coordinate if can_i_walk?(new_coordinate)
  end

  def can_i_walk?(new_coordinate)
    max_step = @tabletop.dimension / 2
    new_coordinate.x >= 0 && new_coordinate.x <= max_step &&
      new_coordinate.y >= 0 && new_coordinate.y <= max_step
  end
end
