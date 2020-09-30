# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Passage, type: :passage do
  let(:transmitters) { Fixtures::Transmitters.base_set }
  let(:polygons) { MapperHelper.polygon_build(transmitters) }

  let(:passage) do
    passage_inst = described_class.new
    passage_inst.polygons = polygons
    passage_inst.trajectory = build_trajectory.call(points)
    passage_inst
  end

  let(:build_trajectory) do
    lambda do |points_map|
      points_map.map { |pos| Point.new(x_pos: pos[:x], y_pos: pos[:y]) }
    end
  end

  context 'when path is safe' do
    let(:points) { [{ x: 10, y: 19 }, { x: 19, y: 14 }] }

    it do
      expect(passage.safe?).to eql 'Safe passage is possible.'
    end
  end

  context 'when path is unsafe' do
    let(:points) { [{ x: 4, y: 21 }, { x: 19, y: 14 }] }

    it do
      expect(passage.safe?).to eql 'Safe passage is not possible.'
    end
  end
end
