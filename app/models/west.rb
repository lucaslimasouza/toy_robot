# frozen_string_literal: true

class West
  extend ActiveModel::Naming

  include Compass

  def to_left
    compass_pointer('SOUTH')
  end

  def to_right
    compass_pointer('NORTH')
  end

  def move(x, y, size_step)
    Coordinate.new(x: x - size_step, y: y)
  end

  def report
    model_name.name.upcase
  end
end
