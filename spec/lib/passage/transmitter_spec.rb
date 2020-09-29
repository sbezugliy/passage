# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Transmitter, type: :transmitter do
  let(:transmitter) { described_class.new(x_pos: 12, y_pos: 19, power: 4) }
  let(:intersecting_transmitter) { described_class.new(x_pos: 8, y_pos: 17, power: 3) }
  let(:non_intersecting_transmitter) { described_class.new(x_pos: 19, y_pos: 19, power: 2) }

  describe '#intersects?(other_transmitter)' do
    context 'when intersects' do
      it { expect(transmitter).to be_intersects(intersecting_transmitter) }
    end

    context 'when not intersects' do
      it { expect(transmitter).not_to be_intersects(non_intersecting_transmitter) }
    end
  end
end
