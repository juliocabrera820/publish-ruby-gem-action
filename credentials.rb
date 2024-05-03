# frozen_string_literal: true

require 'fileutils'

require_relative 'inputs'

# Module to handle credentials
module Credentials
  def self.generate_gh_credentials
    credentials = <<~CREDENTIALS
      ---
      :github: Bearer #{Inputs::GITHUB_TOKEN}
    CREDENTIALS
    write_credentials(credentials)
  end

  def self.generate_rubygems_credentials
    credentials = <<~CREDENTIALS
      ---
      :rubygems_api_key: #{Inputs::RUBYGEMS_API_KEY}
    CREDENTIALS
    write_credentials(credentials)
  end

  def self.write_credentials(credentials)
    credentials_dir_path = "#{Dir.home}/.gem"
    FileUtils.mkdir_p(credentials_dir_path)
    credentials_file_path = "#{credentials_dir_path}/credentials"
    File.open(credentials_file_path, 'w') { |f| f.write(credentials) }
    FileUtils.chmod(0o600, credentials_file_path)
  end

  def self.delete_credentials_file_path
    credentials_file_path = "#{Dir.home}/.gem/credentials"
    FileUtils.rm(credentials_file_path)
  end
end
