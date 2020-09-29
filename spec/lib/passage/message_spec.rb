# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Message do
  describe described_class::Result do
    describe '#safe' do
      it { expect(described_class.safe).to eql 'Safe passage is possible.' }
    end

    describe '#unsafe' do
      it { expect(described_class.unsafe).to eql 'Safe passage is not possible.' }
    end
  end

  describe described_class::CLI do
    describe '#enter_count' do
      it { expect(described_class.enter_count).to eql 'Enter count of transmitters: ' }
    end

    describe '#enter_start' do
      it { expect(described_class.enter_start).to eql 'Enter start position coordinates `<x> <y>`: ' }
    end

    describe '#enter_end' do
      it { expect(described_class.enter_end).to eql 'Enter end position coordinates `<x> <y>`: ' }
    end

    describe '#enter_transmitter(number)' do
      3.times do |number|
        it do
          expect(described_class.enter_transmitter(number))
            .to eql "Enter parameters for transmitter ##{number} `<x> <y> <power>`: "
        end
      end
    end
  end
end
