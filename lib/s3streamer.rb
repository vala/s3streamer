require "s3streamer/engine"

module S3Streamer
  # Defines the default bucket to be used when streaming a file
  #
  mattr_accessor :bucket

  # AWS credentials key to sign in
  #
  mattr_accessor :key

  # AWS credentials secret to sign in
  #
  mattr_accessor :secret

  # Wether or not to configure aws-sdk with credentials from inializer.
  #
  mattr_accessor :config_auth
  @@config_auth = true

  def self.config
    yield self if block_given?
  end

  # Autoloaded components
  autoload :Streamer,          "s3streamer/streamer"
  autoload :ControllerHelpers, "s3streamer/controller_helpers"
end
