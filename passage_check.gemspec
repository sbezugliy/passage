# frozen_string_literal: true

require_relative 'lib/passage/version'

Gem::Specification.new do |spec|
  spec.name          = 'passage'
  spec.version       = VERSION
  spec.authors       = ['Sergey Bezugliy']
  spec.email         = ['sergey@foreto.com', 's.bezugliy@codenv.top']

  spec.summary       = 'Check if vehicle is on a safe path'
  spec.description   = 'Library providing a check of the path for safety by\
trajectory from the start point to end inside of the field of transmitters.'
  spec.homepage      = 'https://bitbucket.org'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  # spec.metadata["allowed_push_host"] = 'https:/rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://bitbucket.org'
  spec.metadata['changelog_uri'] = 'https://bitbucket.org'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem,
  # that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0")
                     .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'guard-rubocop'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
end
