# frozen_string_literal: true

module Compass
  include ActiveSupport::Concern

  def compass_pointer(orientation)
    return North.new if orientation == 'NORTH'
    return South.new if orientation == 'SOUTH'
    return East.new if orientation == 'EAST'
    return West.new if orientation == 'WEST'
    North.new
  end
end
