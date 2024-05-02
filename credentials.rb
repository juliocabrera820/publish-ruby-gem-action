# frozen_string_literal: true

# Module to handle credentials
module Credentials
  RUBYGEMS_API_KEY = ENV['RUBYGEMS_API_KEY']
  GITHUB_TOKEN = ENV['GITHUB_TOKEN']
  GITHUB_USERNAME = ENV['GITHUB_USERNAME']

  def self.print_credentials
    puts "RUBYGEMS_API_KEY: #{RUBYGEMS_API_KEY}"
    puts "GITHUB_TOKEN: #{GITHUB_TOKEN}"
    puts "GITHUB_USERNAME: #{GITHUB_USERNAME}"
  end
end
