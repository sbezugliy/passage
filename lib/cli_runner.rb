# frozen_string_literal: true

require 'passage'
require 'passage/transmitter'
require 'passage/polygon'

# Sampling
PRECISION_AFTER_POINT = 2

# CLIRunner factory class
class CLIRunner
  attr_writer :count_of_transmitters,
              :executor,
              :transmitters,
              :trajectory

  def initialize
    read_inputs
  end

  def read_inputs
    read_count
    init_transmitters
    read_trajectory
    init_polygons
  end

  def set_executor(executor = Passage.new)
    @executor = executor
    @executor.polygons = @polygons
    @executor.trajectory = @trajectory
  end

  def result
    @executor.is_path_safe?
  end

  private

  def init_polygons
    @polygons = Polygon.new(@transmitters)
  end

  def read_count
    $stdout.print(Message::CLI.enter_count)
    @count_of_transmitters = $stdin.readline
  end

  def read_transmitter
    map_input_to_hash(%i[x y z])
  end

  def read_trajectory
    @trajectory = {
      start: map_input_to_hash(%i[x y]),
      end: map_input_to_hash(%i[x y])
    }
  end

  def init_transmitters
    @transmitters = count_of_transmitters.map.with_index do |_, index|
      $stdout.print(Message::CLI[:enter_count])
      Transmitter.new(read_transmitter)
    end
  end

  def map_input_to_hash(keys)
    Hash[keys.zip($stdin.readline.split)]
  end
end
