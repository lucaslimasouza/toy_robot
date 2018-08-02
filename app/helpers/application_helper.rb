# frozen_string_literal: true

module ApplicationHelper
  def show_robot_position?(position, line, column)
    !position.nil? && position[0].to_i == line && position[1].to_i == column
  end
end
