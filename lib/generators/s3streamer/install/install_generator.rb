module S3streamer
  class InstallGenerator < Rails::Generators::Base
    # Copied files come from templates folder
    source_root File.expand_path('../templates', __FILE__)

    # Generator desc
    desc "S3Streamer install generator"

    def copy_initializer_file
      say "Installing default initializer template"
      copy_file "initializer.rb", "config/initializers/s3streamer.rb"
    end
  end
end
