module Swanest
  class Client
    # Defines methods related to URLs
    module Broker

      # Returns all portolios for user
      #
      # @requires_authentication Yes
      #
      # @param options [Hash] A customizable set of options.
      
      def get_portfolios(params={}, options={})
        default_options = {
          url: broker_endpoint
        }
        get("/portfolios", params, default_options.deep_merge(options))
      end

    end
  end
end
