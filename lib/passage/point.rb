# frozen_string_literal: true

# Point class
class Point
  attr_accessor :x_pos, :y_pos

  def initialize(x_pos:, y_pos:)
    @x_pos = x_pos
    @y_pos = y_pos
  end

  def nearest_available_transmitter(transmitters)
    transmitters
      .select { |t1| destination_to(t1) < t1.power }
      .min { |t1, t2| destination_to(t1) <=> destination_to(t2) }
  end

  def destination_to(point)
    point_valid?(point)
    (((@x_pos - point.x_pos).abs2 + (@y_pos - point.y_pos).abs2)**0.5)
      .round(PRECISION_RATE || 2)
  end

  private

  def point_valid?(arg)
    raise unless arg.instance_variable_defined?(:@x_pos)
    raise unless arg.instance_variable_defined?(:@y_pos)
  end
end
