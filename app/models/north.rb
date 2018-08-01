# frozen_string_literal: true

class North
  include Compass

  def to_left
    compass_pointer('WEST')
  end
end
