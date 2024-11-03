# frozen_string_literal: true

require 'credentials'
require 'inputs'

# Module to handle rubygems
module Rubygems
  def self.generate_credentials
    content = ":rubygems_api_key: #{Inputs.rubygems_api_key}"
    Credentials.write_credentials(content)
  end
end
