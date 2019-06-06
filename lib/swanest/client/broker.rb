module Swanest
  class Client
    # Defines methods related to URLs
    module Broker

      # Returns all portolios for user
      #
      # @requires_authentication Yes
      #
      # @param options [Hash] A customizable set of options.
      
      def get_portfolios(options={})
        default_options = {
          url: broker_endpoint
        }
        get("portfolios", connection_options.merge(default_options))
      end

    end
  end
end
