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

      it 'does not play' do
        10.times do
          subject.play('MOVE')
        end

        expect(subject.report).to eq '1,5,NORTH'
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

    context 'facing to EAST' do
      let!(:orientation) { East.new }
      subject do
        Robot.new(
          coordinate,
          orientation,
          tabletop
        )
      end

      it 'move one step on Tabletop' do
        subject.play('MOVE')
        expect(subject.report).to eq '2,2,EAST'
      end

      it 'turn left on Tabletop' do
        subject.play('LEFT')

        expect(subject.report).to eq '1,2,NORTH'
      end

      it 'turn right on Tabletop' do
        subject.play('RIGHT')

        expect(subject.report).to eq '1,2,SOUTH'
      end
    end

    context 'facing to WEST' do
      let!(:orientation) { West.new }
      subject do
        Robot.new(
          coordinate,
          orientation,
          tabletop
        )
      end

      it 'move one step on Tabletop' do
        subject.play('MOVE')
        expect(subject.report).to eq '0,2,WEST'
      end

      it 'turn left on Tabletop' do
        subject.play('LEFT')

        expect(subject.report).to eq '1,2,SOUTH'
      end

      it 'turn right on Tabletop' do
        subject.play('RIGHT')

        expect(subject.report).to eq '1,2,NORTH'
      end
    end

    context 'negative coordenate facing to SOUTH' do
      let!(:orientation) { South.new }
      subject do
        Robot.new(
          Coordinate.new(x: -1, y: 2),
          orientation,
          tabletop
        )
      end

      it 'does not move on Tabletop' do
        subject.play('MOVE')
        expect(subject.report).to eq '-1,2,SOUTH'
      end
    end
  end
end
