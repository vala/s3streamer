S3Streamer.config do |config|
  # Defines the default bucket to be used when streaming a file
  #
  config.bucket = nil

  # AWS credentials key to sign in
  #
  config.key = ""

  # AWS credentials secret to sign in
  #
  config.secret = ""

  # Wether or not to configure aws-sdk with credentials from inializer.
  #
  # Defaults to true, since key and secret are needed, but you may already have
  # initialized config somewhere else, so you just have to toggle the variable
  # to false
  #
  # config.config_auth = false
end
