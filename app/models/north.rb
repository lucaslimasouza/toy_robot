# frozen_string_literal: true

class North
  include Compass

  def to_left
    compass_pointer('WEST')
  end

  def to_right
    compass_pointer('EAST')
  end

  def move(x, y, size_step)
    Coordinate.new(x: x, y: y + size_step)
  end
end
