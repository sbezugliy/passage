# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Polygon, type: :polygon do
  let(:polygon) { described_class.new(transmitters) }

  let(:transmitters) { Fixtures::Transmitters.base_set }

  let(:map_polygon) do
    lambda do |polygon_array|
      polygon_array.map do |t|
        { x_pos: t.x_pos, y_pos: t.y_pos, power: t.power }
      end
    end
  end

  context 'when there are two polygons' do
    it 'returns main polygon' do
      expect(map_polygon.call(polygon.connected))
        .to eql [
          { x_pos: 6, y_pos: 11, power: 4 },
          { x_pos: 8, y_pos: 17, power: 3 },
          { x_pos: 12, y_pos: 19, power: 4 },
          { x_pos: 15, y_pos: 7, power: 6 },
          { x_pos: 19, y_pos: 11, power: 4 }
        ]
    end

    it 'returns unconnected transmitters' do
      expect(map_polygon.call(polygon.unconnected))
        .to eql [{ power: 2, x_pos: 19, y_pos: 19 }]
    end
  end

  describe '#safe?' do
    let(:transmitters) do
      [
        Transmitter.new(x_pos: 10, y_pos: 10, power: 5),
        Transmitter.new(x_pos: 17, y_pos: 12, power: 4)
      ]
    end

    context 'when point is inside of range' do
      let(:trajectory) do
        [Point.new(x_pos: 12, y_pos: 12)]
      end

      it do
        expect(polygon.safe?(trajectory))
          .to be true
      end
    end

    context 'when point is out of range' do
      let(:trajectory) do
        [Point.new(x_pos: 12, y_pos: 16)]
      end

      it do
        expect(polygon.safe?(trajectory))
          .to be false
      end
    end
  end
end
