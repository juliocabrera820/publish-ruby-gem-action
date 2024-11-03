# frozen_string_literal: true

require_relative 'credentials'
require_relative 'inputs'

# Module to handle GitHub Packages
module GithubPackages
  def self.generate_credentials
    content = ":github: Bearer #{Inputs.github_token}"
    Credentials.write_credentials(content)
  end

  def self.github_url
    "https://rubygems.pkg.github.com/#{Inputs.github_username}"
  end
end
