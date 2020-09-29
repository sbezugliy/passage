# frozen_string_literal: true

class Polygon
  attr_accessor :polygon
  attr_writer :transmitters
  attr_reader :not_connected

  def initialize(transmitters)
    @transmitters = transmitters
    @polygon = []
    @not_connected = []
    build_polygon
  end

  private

  def build_polygon
    collect_intersections(@transmitters.shift)
  end

  def collect_intersections(current_transmitter)
    @transmitters.each do |transmitter|
      if current_transmitter.intersects?(transmitter)
        @polygon << transmitter
        return
      end
      @not_connected << transmitter
    end
  end
end
