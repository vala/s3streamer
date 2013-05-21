require "rails"
require "aws"

module S3Streamer
  class Engine < Rails::Engine
    initializer "Initialize S3 Streamer" do |app|
      # Include controller helpers in application controller
      app.config.to_prepare do
        ActiveSupport.on_load :action_controller do
          ApplicationController.send(:include, ControllerHelpers)
        end
      end

      # Configure aws-sdk authentication
      AWS.config(
        access_key_id: S3Streamer.key,
        secret_access_key: S3Streamer.secret
      )
    end
  end
end