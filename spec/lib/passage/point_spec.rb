# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Point do
  let(:point_a) { described_class.new(x_pos: 2, y_pos: 6) }

  describe '#destination_to(point)' do
    let(:point_b) { described_class.new(x_pos: 20, y_pos: 37) }

    it { expect(point_a.destination_to(point_b)).to be 35.85 }
  end

  describe '#find_nearest_available' do
    let(:points) do
    end
  end
end
