require 'faraday'
require 'faraday_middleware'
require 'swanest/core_ext/hash'
require 'json'

module Swanest
	module Connection
    private

    # Returns a Faraday::Connection object
    #
    # @param options [Hash] A hash of options
    # @return [Faraday::Connection]
    def connection(options={})
      default_options = {
        :headers => {
          "Accept" => 'application/json',
          "Content-Type" => 'application/json',
          "User-Agent" => user_agent,
          "Cache-Control" => 'no-cache'
        },
        :ssl => {:verify => false }
      }

      @connection = Faraday.new(connection_options.deep_merge(default_options.deep_merge(options))) do |builder|
        #builder.use Swanest::Request::MultipartWithFile
        #builder.use Swanest::Request::SwanestOAuth, authentication if authenticated?
        #builder.use Faraday::Request::Multipart
        #builder.use Faraday::Request::UrlEncoded
        #builder.use Swanest::Request::Gateway, gateway if gateway
        #builder.use Swanest::Response::RaiseClientError
        #builder.use Faraday::Response::Mashify
        builder.use Faraday::Response::ParseJson
        #builder.use Swanest::Response::RaiseServerError
        builder.adapter(adapter)
      end

      @connection
    end
  end

end