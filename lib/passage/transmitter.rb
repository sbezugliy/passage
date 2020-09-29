# frozen_string_literal: true

class Transmitter
  attr_accessor :x, :y, :power

  def initialize(x:, y:, power:)
    @x = x
    @y = y
    @power = power
  end

  def destination_to(point)
    (((@x-point[:x]).abs2 + (@y-point[:y]).abs2)**0.5).round(PRECISION_AFTER_POINT)
  end

  def intersects?(other_transmitter)
    destination_to(point) < @power + other_transmitter[:power]
  end
end
