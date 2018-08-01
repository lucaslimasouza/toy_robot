# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tabletop, type: :model do
  describe 'validations' do
    %i[axisX axisY unit_grid].each do |field|
      it { is_expected.to validate_presence_of field }
    end
  end
end
