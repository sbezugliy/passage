# frozen_string_literal: true

# Polygon helper mixins
module MapperHelper
  def self.polygon_build(transmitters)
    @polygons = []
    @polygon = Polygon.new(transmitters)
    loop do
      @polygons << @polygon
      break if @polygon.unconnected.empty?

      @polygon = Polygon.new(@polygon.unconnected)
    end
    @polygons
  end

  def self.map_input_to_hash(keys)
    Hash[keys.zip($stdin.readline.split.map(&:to_i))]
  end
end
