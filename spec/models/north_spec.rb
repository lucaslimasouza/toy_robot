
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe North, type: :model do
  describe '#to_left' do
    it 'return WEST pointer' do
      expect(subject.to_left).to be_an_instance_of West
    end
  end

  describe '#to_right' do
    it 'return EAST pointer' do
      expect(subject.to_right).to be_an_instance_of East
    end
  end

  describe '#move' do
    it 'return new Coordinate' do
      coordinate = subject.move(1, 2, 1)
      expect(coordinate).to be_an_instance_of Coordinate
      expect(coordinate.x).to eq 1
      expect(coordinate.y).to eq 3
    end
  end
end
