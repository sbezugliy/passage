# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Passage, type: :passage do
  let(:transmitters) { Fixtures::Transmitters.base_set }
  let(:polygons) { MapperHelper.polygon_build(transmitters) }

  let(:passage) do
    passage_inst = described_class.new
    passage_inst.polygons = polygons
    passage_inst.trajectory = build_trajectory.call(points_map)
    passage_inst
  end

  let(:build_trajectory) do
    lambda do |points_map|
      points_map.map do |pos|
        Point.new(x_pos: pos[:x], y_pos: pos[:y])
      end
    end
  end

  context 'when path is safe' do
    let(:points_map) do
      [
        { x: 10, y: 19 },
        { x: 19, y: 14 }
      ]
    end

    it do
      expect(passage.safe?).to eql 'Safe passage is possible.'
    end
  end

  xcontext 'when path is unsafe' do
    let(:points_map) do
      [
        { x: 4, y: 21 },
        { x: 19, y: 14 }
      ]
    end

    xit do
      expect(passage.safe?).to eql 'Safe passage is not possible.'
    end
  end
end
