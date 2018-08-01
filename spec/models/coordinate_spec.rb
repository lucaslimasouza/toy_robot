
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Coordinate, type: :model do
  subject { Coordinate.new(x: 1, y: 1) }

  describe 'validations' do
    %i[x y].each do |field|
      it { is_expected.to validate_presence_of field }
    end
  end
end
