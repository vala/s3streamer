module S3Streamer
  class Streamer
    attr_accessor :object
    # Creates a Stremer object by fetching object the to be stremed
    # and storing it for further processing
    #
    # @param [String] key The path to the object in the bucket
    # @param [String] bucket The bucket name to use. Can be omitted to use
    #   the default configured bucket
    #
    def initialize key, bucket = nil
      # Use default bucket if not set
      bucket ||= S3Streamer.bucket
      # Fetch object to be streamed
      @object = AWS::S3::Bucket.new(bucket).objects[key]
    end

    # Method to be called by Rack to stream our stored object
    #
    def each
      @object.read do |segment|
        yield segment
      end
    end
  end
end