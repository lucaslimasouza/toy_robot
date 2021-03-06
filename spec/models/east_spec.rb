
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe East, type: :model do
  describe '#to_left' do
    it 'return NORTH pointer' do
      expect(subject.to_left).to be_an_instance_of North
    end
  end

  describe '#to_right' do
    it 'return SOUTH pointer' do
      expect(subject.to_right).to be_an_instance_of South
    end
  end

  describe '#move' do
    it 'return new Coordinate' do
      coordinate = subject.move(1, 2, 1)
      expect(coordinate).to be_an_instance_of Coordinate
      expect(coordinate.x).to eq 2
      expect(coordinate.y).to eq 2
    end
  end

  describe '#report' do
    it 'return EAST' do
      expect(subject.report).to eq 'EAST'
    end
  end
end
