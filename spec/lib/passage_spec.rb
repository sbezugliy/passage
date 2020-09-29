# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Passage, type: :passage do
  let(:transmitters) { Fixtures::Transmitters.base_set }
  let(:polygons) { MapperHelper.polygon_build(transmitters) }

  let(:passage) do
    passage_inst = described_class.new
    passage_inst.polygons = polygons
    passage_inst.trajectory = trajectory
    passage_inst
  end

  context 'when path is safe' do
    let(:trajectory) do
      [
        Point.new(x_pos: 10, y_pos: 19),
        Point.new(x_pos: 19, y_pos: 14)
      ]
    end

    it do
      expect(passage.safe?).to eql 'Safe passage is possible.'
    end
  end

  xcontext 'when path is unsafe' do
    let(:trajectory) do
      [
        Point.new(x_pos: 4, y_pos: 21),
        Point.new(x_pos: 19, y_pos: 14)
      ]
    end

    xit do
      expect(passage.safe?).to eql 'Safe passage is not possible.'
    end
  end
end
