# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tabletop, type: :model do
  AXIS_X = 5
  AXIS_Y = 5
  UNIT_GRID = 1

  subject { Tabletop.new(axisX: AXIS_X, axisY: AXIS_Y, unit_grid: UNIT_GRID) }

  describe 'validations' do
    %i[axisX axisY unit_grid].each do |field|
      it { is_expected.to validate_presence_of field }
    end
  end

  describe '#dimension' do
    it 'return the Tabletop dimension' do
      expect(subject.dimension).to eq(10)
    end
  end

  describe '#compass_pointer' do
    it 'return the NORTH pointer' do
      expect(subject.compass_pointer('NORTH')).to be_an_instance_of North
    end

    it 'return the SOUTH pointer' do
      expect(subject.compass_pointer('SOUTH')).to be_an_instance_of South
    end

    it 'return the EAST pointer' do
      expect(subject.compass_pointer('EAST')).to be_an_instance_of East
    end
  end
end
