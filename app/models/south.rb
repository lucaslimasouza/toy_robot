# frozen_string_literal: true

class South
  extend ActiveModel::Naming

  include Compass

  def to_left
    compass_pointer('EAST')
  end

  def to_right
    compass_pointer('WEST')
  end

  def move(x, y, size_step)
    Coordinate.new(x: x, y: y - size_step)
  end

  def report
    model_name.name.upcase
  end
end
