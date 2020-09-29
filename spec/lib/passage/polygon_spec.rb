# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Polygon, type: :polygon do
  let(:polygon) { described_class.new(transmitters) }

  let(:transmitters) { Fixtures::Transmitters.base_set }

  context 'when there are two polygons' do
    it 'returns main polygon' do
      expect(polygon.connected.map { |t| { x_pos: t.x_pos, y_pos: t.y_pos, power: t.power } })
        .to eql [
          { x_pos: 6, y_pos: 11, power: 4 },
          { x_pos: 8, y_pos: 17, power: 3 },
          { x_pos: 12, y_pos: 19, power: 4 },
          { x_pos: 15, y_pos: 7, power: 6 },
          { x_pos: 19, y_pos: 11, power: 4 }
        ]
    end

    it 'returns unconnected transmitters' do
      expect(polygon.unconnected.map { |t| { x_pos: t.x_pos, y_pos: t.y_pos, power: t.power } })
        .to eql [{ power: 2, x_pos: 19, y_pos: 19 }]
    end
  end
end
