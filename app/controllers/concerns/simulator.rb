# frozen_string_literal: true

module Simulator
  include BaseSimulator

  def default_commands
    params[:commands].split("\r\n")
  end
end
