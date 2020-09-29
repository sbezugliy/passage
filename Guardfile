# frozen_string_literal: true

# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exist?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

# Note: The cmd option is now required due to the increasing number of ways
#       rspec may be run, below are examples of the most common uses.
#  * bundler: 'bundle exec rspec'
#  * bundler binstubs: 'bin/rspec'
#  * spring: 'bin/rspec' (This will use spring if running and you have
#                          installed the spring binstubs per the docs)
#  * zeus: 'zeus rspec' (requires the server to be started separately)
#  * 'just' rspec: 'rspec'

clearing :on

if ENV['RACK_ENV'] == 'test'
  scope groups: [:qa]
  scope plugins: %i[rspec rubocop]
else
  scope groups: [:server]
  scope plugins: [:rack]
end

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

group :server do
  guard :rack,
        server: :thin,
        host: '0.0.0.0',
        port: 3000 do
    watch('Gemfile.lock')
    watch(%r{^(config|lib|app)/.*})
  end
end
