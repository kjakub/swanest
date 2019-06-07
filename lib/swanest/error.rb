module Swanest
  # Custom error class for rescuing from all Swanest errors
  class Error < StandardError
    attr_reader :http_headers

    # Initializes new Error object
    #
    # @param [String] message
    # @param [Hash] http_headers
    # @return [Swanest::Error]
    def initialize(message, http_headers={})
      @http_headers = http_headers
      super message
    end

  end
end