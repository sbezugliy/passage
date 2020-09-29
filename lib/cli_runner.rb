# frozen_string_literal: true

require 'passage'

# CLIRunner factory class
class CLIRunner
  attr_accessor :count_of_transmitters,
                :executor,
                :transmitters,
                :trajectory,
                :polygons

  def initialize
    @transmitters = []
    @polygons = []
    read_inputs
  end

  def read_inputs
    read_count
    init_transmitters
    read_trajectory
    init_polygons
  end

  def init_executor(executor = Passage.new)
    @executor = executor
    @executor.polygons = @polygons
    @executor.trajectory = @trajectory
  end

  def result
    $stdout.print("#{@executor.safe?}\n")
  end

  private

  def init_polygons
    @polygons = MapperHelper.polygon_build(@transmitters)
  end

  def read_count
    $stdout.print(Message::CLI.enter_count)
    @count_of_transmitters = $stdin.readline
  end

  def read_transmitter
    MapperHelper.map_input_to_hash(%i[x_pos y_pos power])
  end

  def read_trajectory
    @trajectory = []
    $stdout.print(Message::CLI.enter_start)
    @trajectory << Point.new(**MapperHelper.map_input_to_hash(%i[x_pos y_pos]))
    $stdout.print(Message::CLI.enter_end)
    @trajectory << Point.new(**MapperHelper.map_input_to_hash(%i[x_pos y_pos]))
  end

  def init_transmitters
    @count_of_transmitters.to_i.times do |number|
      $stdout.print(Message::CLI.enter_transmitter(number))
      @transmitters << Transmitter.new(**read_transmitter)
    end
  end
end
