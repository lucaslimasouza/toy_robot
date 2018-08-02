# frozen_string_literal: true

class Coordinate
  include ActiveModel::Model

  attr_accessor :x, :y

  validates :x, :y, presence: true
  validates :x, :y, numericality: { greater_than_or_equal_to: 0 }

  def report
    "#{@x},#{@y}"
  end
end
