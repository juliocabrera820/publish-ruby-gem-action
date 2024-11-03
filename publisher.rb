# frozen_string_literal: true

require_relative 'command_system'
require_relative 'github_packages'
require_relative 'inputs'
require_relative 'publisher'
require_relative 'rubygems'

# Module for publishing gems to Rubygems or GitHub Packages
module Publisher
  GEM_EXTENSION = '*.gem'

  def self.publish_to_rubygems
    Rubygems.generate_credentials
    gems = check_gem_files

    gems.each do |gem_file|
      CommandSystem.run_command('gem', 'push', gem_file)
    end
  end

  def self.publish_to_github_packages
    GithubPackages.generate_credentials
    gems = check_gem_files

    gems.each do |gem_file|
      CommandSystem.run_command('gem', 'push', gem_file, '--key', 'github', '--host', GithubPackages.github_url)
    end
  end

  def self.check_gem_files
    gems = Dir.glob(GEM_EXTENSION)
    exit 1 if gems.empty?

    gems
  end
end
