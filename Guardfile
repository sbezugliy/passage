# frozen_string_literal: true

clearing :on

scope groups: [:qa]
scope plugins: %i[rspec rubocop]

group :qa do
  guard :rspec, all_on_start: true, cmd: 'rspec -c --format doc' do
    require 'guard/rspec/dsl'
    dsl = Guard::RSpec::Dsl.new(self)

    # Feel free to open issues for suggestions and improvements
    watch('Gemfile.lock')
    watch(%r{^(config|lib|app)/.*})
    # RSpec files
    rspec = dsl.rspec
    watch(rspec.spec_helper) { rspec.spec_dir }
    watch(rspec.spec_support) { rspec.spec_dir }
    watch(rspec.spec_files)

    # Ruby files
    ruby = dsl.ruby
    dsl.watch_spec_files_for(ruby.lib_files)
    dsl.watch_spec_files_for(%r{^(config|app)/.*})

    watch(%r{^spec/fabricators/.+_spec\.rb$})
    watch(%r{^spec/concepts/.+/.+/.+_spec\.rb$})
    watch(%r{^spec/requests/.+/.+_spec\.rb$})

    # Turnip features and steps
    watch(%r{^spec/acceptance/(.+)\.feature$})
    watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
      Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance'
    end
  end

  guard :rubocop, all_on_start: true do
    watch(/.+\.rb$/)
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { |m| File.dirname(m[0]) }
  end
end
