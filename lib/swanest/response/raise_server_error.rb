require 'faraday'
require 'angellist_api/error/internal_server_error'


module Swanest
  module Response
    class RaiseServerError < Faraday::Response::Middleware
      def on_complete(env)
        case env[:status].to_i
        when 500
          raise Swanest::Error::InternalServerError.new(error_message(env, "Something is technically wrong."), env[:response_headers])
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