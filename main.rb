# frozen_string_literal: true

require_relative 'gem_builder'
require_relative 'publish'
require_relative 'inputs'

begin
  GemBuilder.build
  Publish.to_rubygems if Inputs.rubygems_api_key?
  Publish.to_github_packages if Inputs.github_token?
ensure
  Credentials.delete_credentials_file_path
end
