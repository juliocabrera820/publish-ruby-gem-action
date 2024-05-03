# frozen_string_literal: true

require 'fileutils'

require_relative 'inputs'

# Module to handle credentials
module Credentials
  def self.generate_gh_credentials
    github_token = Inputs::GITHUB_TOKEN
    exit 1 if github_token.nil?

    credentials = <<~CREDENTIALS
      ---
      :github: Bearer #{github_token}
    CREDENTIALS
    write_credentials(credentials)
  end

  def self.generate_rubygems_credentials
    rubygems_api_key = Inputs::RUBYGEMS_API_KEY
    exit 1 if rubygems_api_key.nil?

    credentials = <<~CREDENTIALS
      ---
      :rubygems_api_key: #{rubygems_api_key}
    CREDENTIALS
    write_credentials(credentials)
  end

  def self.write_credentials(credentials)
    credentials_dir_path = "#{Dir.home}/.gem"
    credentials_file_path = "#{credentials_dir_path}/credentials"
    FileUtils.mkdir_p(credentials_dir_path)
    File.open(credentials_file_path, 'w') { |f| f.write(credentials) }
    FileUtils.chmod(0o600, credentials_file_path)
  end
end
