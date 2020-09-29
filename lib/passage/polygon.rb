# frozen_string_literal: true

# Polygon class
class Polygon
  attr_accessor :connected
  attr_reader :unconnected

  def initialize(transmitters)
    @unconnected = transmitters
    @connected = []
    build_polygon
  end

  def safe?(trajectory)
    trajectory.each do |point|
      return false unless point.nearest_available_transmitter(@connected).nil?
    end
    true
  end

  private

  def build_polygon
    first_transmitter = @unconnected.shift
    @connected << first_transmitter
    connect(first_transmitter)
  end

  def connect(current_transmitter)
    @unconnected.each.with_index do |transmitter, index|
      if current_transmitter.intersects?(transmitter)
        @connected << transmitter
        connect(@unconnected.delete_at(index))
      end
    end
  end
end
