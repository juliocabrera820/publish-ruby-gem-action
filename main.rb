# frozen_string_literal: true

require_relative 'credentials'
require_relative 'gem_builder'
require_relative 'inputs'
require_relative 'publisher'

begin
  GemBuilder.build
  Credentials.generate_credentials_file
  Publisher.to_rubygems if Inputs.rubygems_api_key?
  Publisher.to_github_packages if Inputs.github_token?
ensure
  Credentials.delete_credentials_file_path
end
