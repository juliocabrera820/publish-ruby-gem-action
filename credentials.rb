# frozen_string_literal: true

require 'fileutils'

require_relative 'inputs'

# Module to handle credentials
module Credentials
  def self.add_gh_credentials
    credentials = ":github: Bearer #{Inputs.github_token}"
    write_credentials(credentials)
  end

  def self.add_rubygems_credentials
    credentials = ":rubygems_api_key: #{Inputs.rubygems_api_key}"
    write_credentials(credentials)
  end

  def self.generate_credentials_file
    FileUtils.mkdir_p(gems_path)
    file_start = "---\n"
    File.open(credentials_file_path, 'w') { |f| f.write(file_start) }
  end

  def self.write_credentials(credentials)
    File.open(credentials_file_path, 'a') { |f| f.write("#{credentials}\n") }
    FileUtils.chmod(0o600, credentials_file_path)
  end

  def self.gems_path
    @gems_path ||= "#{Dir.home}/.gem"
  end

  def self.credentials_file_path
    @credentials_file_path ||= "#{gems_path}/credentials"
  end

  def self.delete_credentials_file_path
    FileUtils.rm(credentials_file_path) if File.exist?(credentials_file_path)
  end
end
