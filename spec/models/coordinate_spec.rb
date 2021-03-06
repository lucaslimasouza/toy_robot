
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Coordinate, type: :model do
  subject { Coordinate.new(x: 1, y: 2) }

  describe 'validations' do
    %i[x y].each do |field|
      it { is_expected.to validate_presence_of field }
      it { validate_numericality_of(field).is_greater_than_or_equal_to(0) }
    end
  end

  describe '#report' do
    it 'return x y value' do
      expect(subject.report).to eq '1,2'
    end
  end
end
