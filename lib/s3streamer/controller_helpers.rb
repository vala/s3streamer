module S3Streamer
  module ControllerHelpers
    def stream_file item, options = {}
      case item.class.to_s
      when "Paperclip::Attachment"
        path = item.path.gsub(/^\//, '')
        options[:name] ||= File.basename(item.original_filename)
        options[:content_type] ||= item.content_type
      else
        path = item
        begin
          options[:name] ||= File.basename(item)
        rescue TypeError => e
          raise TypeError.new e.message +
            " -- #stream_file only accepts String or Paperclip::Attachment" +
            " as its first argument"
        end
      end

      content_disposition = "attachment; filename=#{ options[:name] }"
      # Add content type if we have it
      if options[:content_type]
        content_disposition += "; content-type:#{ options[:content_type] }"
      end
      # Set Content-Disposition HTTP header
      response.headers['Content-Disposition'] = content_disposition

      self.response_body = Streamer.new(path, options[:bucket])
    end
  end
end