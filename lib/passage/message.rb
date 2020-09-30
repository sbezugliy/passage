# frozen_string_literal: true

# Messages module
module Message
  # Result messages
  module Result
    class << self
      def safe
        'Safe passage is possible.'
      end

      def unsafe
        'Safe passage is not possible.'
      end
    end
  end

  # CLI helper messages
  module CLI
    class << self
      def enter_count
        'Enter count of transmitters: '
      end

      def enter_transmitter(number)
        "Enter transmitter ##{number} `<x> <y> <power>`: "
      end

      def enter_start
        'Enter start position coordinates `<x> <y>`: '
      end

      def enter_end
        'Enter end position coordinates `<x> <y>`: '
      end
      end
  end
end
