# frozen_string_literal: true

require_relative 'credentials'
require_relative 'gem_builder'
require_relative 'inputs'
require_relative 'publish'
require_relative "command_system"

begin
  # GemBuilder.build
  Credentials.generate_credentials_file
  Publish.to_rubygems if Inputs.rubygems_api_key?
  Publish.to_github_packages if Inputs.github_token?
ensure
  Credentials.delete_credentials_file_path
end
