# frozen_string_literal: true

require_relative 'command_system'

# Module to build gem based on gemspec file
module GemBuilder
  GEMSPEC_EXTENSION = '*.gemspec'

  def self.build
    gemspec_files = Dir.glob(GEMSPEC_EXTENSION)
    exit 1 if gemspec_files.empty?

    gemspec_files.each do |gemspec_file|
      CommandSystem.run_command('gem', 'build', gemspec_file)
    end
  end
end
