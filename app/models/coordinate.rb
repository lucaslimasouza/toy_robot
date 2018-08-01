# frozen_string_literal: true

class Coordinate
  include ActiveModel::Model

  attr_accessor :x, :y

  validates :x, :y, presence: true

  def report
    "#{@x} #{@y}"
  end
end
