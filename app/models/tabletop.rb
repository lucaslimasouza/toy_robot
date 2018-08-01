# frozen_string_literal: true

class Tabletop
  include ActiveModel::Model
  include Compass

  attr_accessor :axisX, :axisY, :unit_grid

  validates :axisX, :axisY, :unit_grid, presence: true

  def dimension
    @axisX + @axisY
  end
end
