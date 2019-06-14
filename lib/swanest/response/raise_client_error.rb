require 'faraday'
require 'swanest/error/bad_request'

module Swanest
  module Response
    class RaiseClientError < Faraday::Response::Middleware
      def on_complete(env)
        case env[:status].to_i
        when 400..499
          raise Swanest::Error::BadRequest.new(error_message(env), env[:response_headers])
        end
      end

      private

      def error_message(env)
        "#{env[:method].to_s.upcase} #{env[:url].to_s}: #{env[:status]} #{error_body(env[:body])}"
      end

      def error_body(body)
        # will be json because faraday parser
        body
      end
    end
  end
end
