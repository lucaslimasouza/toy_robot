
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe North, type: :model do
  describe '#to_left' do
    it 'return WEST pointer' do
      expect(subject.to_left).to be_an_instance_of West
    end
  end
end
