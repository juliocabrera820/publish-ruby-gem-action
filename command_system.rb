# frozen_string_literal: true

# Module to run a command and exit if it fails
module CommandSystem
  def self.run_command(*cmd)
    exit 1 unless system(*cmd)
  end
end
