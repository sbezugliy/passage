# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Transmitter, type: :transmitter do
  let(:transmitter) do
    described_class.new(x_pos: 12, y_pos: 19, power: 4)
  end
  let(:intersecting_transmitter) do
    described_class.new(x_pos: 8, y_pos: 17, power: 3)
  end
  let(:non_intersecting_transmitter) do
    described_class.new(x_pos: 19, y_pos: 19, power: 2)
  end

  describe '#intersects?(other_transmitter)' do
    context 'when intersects' do
      it { expect(transmitter).to be_intersects(intersecting_transmitter) }
    end

    context 'when not intersects' do
      it { expect(transmitter).not_to be_intersects(non_intersecting_transmitter) }
    end
  end
end
