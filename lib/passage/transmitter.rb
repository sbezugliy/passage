# frozen_string_literal: true

# Transmitter class
class Transmitter < Point
  attr_accessor :power

  def initialize(x_pos:, y_pos:, power:)
    super(x_pos: x_pos, y_pos: y_pos)
    @power = power
  end

  def intersects?(other_transmitter)
    destination_to(other_transmitter) < (@power + other_transmitter.power)
  end
end
