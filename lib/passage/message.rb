# Messages module
module Message
  # Result messages
  module Result
    def safe
      'Safe passage is possible.'
    end

    def unsafe
      'Safe passage is not possible.'
    end
  end

  # CLI helper messages
  module CLI
    def enter_count
      'Enter count of transmitters: '
    end

    def enter_transmitter_parameters(number)
      "Enter parameters for transmitter ##{number} `<x> <y> <power>`: "
    end

    def enter_start
      'Enter start position coordinates `<x> <y>`: '
    end

    def enter_end
      'Enter end position coordinates `<x> <y>`: '
    end
  end
end
