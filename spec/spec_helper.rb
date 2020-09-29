# frozen_string_literal: true

require 'passage'
require 'cli_runner'
require 'support/transmitters_fixture'

RSpec.configure do |config|
  config.include Fixtures::Transmitters, type: %i[
    point
    transmitter
    polygon
    passage
  ]
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
