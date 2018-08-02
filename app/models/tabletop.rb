# frozen_string_literal: true

class Tabletop
  include ActiveModel::Model

  attr_accessor :axisX, :axisY, :unit_grid

  validates :axisX, :axisY, :unit_grid, presence: true
  validates :axisX, :axisY, :unit_grid, numericality: { greater_than_or_equal_to: 0 }

  def dimension
    @axisX + @axisY
  end
end
