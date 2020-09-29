# frozen_string_literal: true

# Class providing checking interface
class Passage
  attr_accessor :polygons, :trajectory

  def safe?
    @polygons.each do |polygon|
      return Message::Result[:safe] if polygon.safe?(@trajectory)
    end
    Message::Result[:unsafe]
  end
end
