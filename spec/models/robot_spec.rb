# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Robot, type: :model do
  let!(:coordinate) { Coordinate.new(x: 1, y: 2) }
  let!(:tabletop) { Tabletop.new(axisX: 5, axisY: 5, unit_grid: 1) }

  describe '#play' do
    context 'facing to North' do
      let!(:orientation) { North.new }
      subject do
        Robot.new(
          coordinate,
          orientation,
          tabletop
        )
      end

      it 'move one step on Tabletop' do
        subject.play('MOVE')

        expect(subject.report).to eq '1,3,NORTH'
      end
    end
  end
end
