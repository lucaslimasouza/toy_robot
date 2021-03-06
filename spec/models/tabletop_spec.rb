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
      it { validate_numericality_of(field).is_greater_than_or_equal_to(0) }
    end
  end

  describe '#dimension' do
    it 'return the Tabletop dimension' do
      expect(subject.dimension).to eq(10)
    end
  end
end
