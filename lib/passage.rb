# frozen_string_literal: true

require 'passage/message'
require 'passage/point'
require 'passage/transmitter'
require 'passage/polygon'
require 'passage/mapper_helper'

PRECISION_RATE = 2

# Class providing checking interface
class Passage
  attr_accessor :polygons, :trajectory
  attr_reader :status

  def safe?
    @status = @polygons.map { |polygon| polygon.safe?(@trajectory) }.include?(true)
    @status ? Message::Result.safe : Message::Result.unsafe
  end
end
