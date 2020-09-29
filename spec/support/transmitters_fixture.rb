# frozen_string_literal: true

module Fixtures
  module Transmitters
    def self.base_set
      [
        { x_pos: 6, y_pos: 11, power: 4 },
        { x_pos: 8, y_pos:  17, power: 3 },
        { x_pos: 19, y_pos:  19, power:  2 },
        { x_pos: 19, y_pos:  11, power:  4 },
        { x_pos: 15, y_pos:  7, power: 6 },
        { x_pos: 12, y_pos:  19, power: 4 }
      ].map { |t| Transmitter.new(**t) }
    end
  end
end
