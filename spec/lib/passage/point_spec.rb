# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Point, type: :point do
  let(:point) { described_class.new(x_pos: 10, y_pos: 19) }

  describe '#destination_to(point)' do
    let(:point_2) { described_class.new(x_pos: 19, y_pos: 14) }

    it { expect(point.destination_to(point_2)).to be 10.3 }
  end

  describe '#nearest_available_transmitter(transmitters)' do
    let(:transmitters) { Fixtures::Transmitters.base_set }
    let(:nearest_transmitter) do
      point.nearest_available_transmitter(transmitters)
    end

    it do
      expect(nearest_transmitter.x_pos).to be 12
      expect(nearest_transmitter.y_pos).to be 19
      expect(nearest_transmitter.power).to be 4
    end
  end
end
