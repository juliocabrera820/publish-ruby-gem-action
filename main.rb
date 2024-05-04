# frozen_string_literal: true

require_relative 'gem_builder'
require_relative 'publish'
require_relative 'credentials'
require_relative 'inputs'

begin
  puts "::debug:: github token: #{Inputs::GITHUB_TOKEN}"
  puts "::debug:: rubygems: #{Inputs::RUBYGEMS_API_KEY}"
  GemBuilder.build
  Publish.to_rubygems unless Inputs::RUBYGEMS_API_KEY.nil?
  Publish.to_github_packages unless Inputs::GITHUB_TOKEN.nil?
ensure
  # Credentials.delete_credentials_file_path
end
