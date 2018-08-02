# frozen_string_literal: true

class RobotsController < ApplicationController
  include Simulator

  def index
    @tabletop = Tabletop.new(axisX: 5, axisY: 5, unit_grid: 1)
    begin
      @position = simulate.split(',') if params[:commands]
    rescue Exception => e
      puts "Error on play the Robot => #{e}"
    end
  end
end
