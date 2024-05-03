# frozen_string_literal: true

require_relative 'command_system'
require_relative 'inputs'
require_relative 'credentials'

# Module for publishing gems to Rubygems and GitHub Packages
module Publish
  GEM_EXTENSION = '*.gem'

  def self.to_rubygems
    Credentials.generate_gh_credentials
    gems = check_gem_files

    gems.each do |gem_file|
      CommandSystem.run_command('gem', 'push', gem_file)
    end
  end

  def self.to_github_packages
    Credentials.generate_rubygems_credentials
    gems = check_gem_files

    gems.each do |gem_file|
      CommandSystem.run_command('gem', 'push', gem_file, '--key', 'github', '--host', github_url)
    end
  end

  def self.check_gem_files
    gems = Dir.glob(GEM_EXTENSION)
    exit 1 if gems.empty?

    gems
  end

  def self.github_url
    "https://rubygems.pkg.github.com/#{Inputs::GITHUB_USERNAME}"
  end
end
