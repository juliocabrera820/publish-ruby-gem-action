# frozen_string_literal: true

# Module to handle action inputs
module Inputs
  RUBYGEMS_API_KEY = ENV['RUBYGEMS_API_KEY']
  GITHUB_TOKEN = ENV['GITHUB_TOKEN']
  GITHUB_USERNAME = ENV['GITHUB_USERNAME']

  def self.github_token?
    !GITHUB_TOKEN.nil?
  end

  def self.rubygems_api_key?
    !RUBYGEMS_API_KEY.nil?
  end

  def self.github_token
    GITHUB_TOKEN
  end

  def self.rubygems_api_key
    RUBYGEMS_API_KEY
  end

  def self.github_username
    GITHUB_USERNAME
  end
end
