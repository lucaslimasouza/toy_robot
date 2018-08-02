# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Robot, type: :model do
  let!(:coordinate) { Coordinate.new(x: 1, y: 2) }
  let!(:tabletop) { Tabletop.new(axisX: 5, axisY: 5, unit_grid: 1) }

  describe '#play' do
    context 'facing to NORTH' do
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

      it 'turn left on Tabletop' do
        subject.play('LEFT')

        expect(subject.report).to eq '1,2,WEST'
      end

      it 'turn right on Tabletop' do
        subject.play('RIGHT')

        expect(subject.report).to eq '1,2,EAST'
      end
    end

    context 'facing to SOUTH' do
      let!(:orientation) { South.new }
      subject do
        Robot.new(
          coordinate,
          orientation,
          tabletop
        )
      end

      it 'move one step on Tabletop' do
        subject.play('MOVE')
        expect(subject.report).to eq '1,1,SOUTH'
      end

      it 'turn left on Tabletop' do
        subject.play('LEFT')

        expect(subject.report).to eq '1,2,EAST'
      end

      it 'turn right on Tabletop' do
        subject.play('RIGHT')

        expect(subject.report).to eq '1,2,WEST'
      end
    end
  end
end
