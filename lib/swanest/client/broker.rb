module Swanest
  class Client
    # Defines methods related to URLs
    module Broker

      # Create user's portfolio 
      #
      # @requires_authentication Yes
      #
      # @param options [Hash] 
      # @param example {isLive: false, name: "my name", config: { currency: "EUR", targetRiskNumber: 1, timeHorizon: { years: 3 }, createdAt: "2019-05-23T14:42:02.523Z" }}

      def create_portfolio(params={}, options={}, user_access_token)
        default_params = {}
        default_options = {
          url: broker_endpoint,
          headers: {
            "Authorization" => "Bearer #{user_access_token}"
          }
        }
        post("/portfolios", default_params.deep_merge(params), default_options.deep_merge(options))
      end

      # Returns all portolios for user
      #
      # @requires_authentication Yes
      #
      # @param options [Hash] A customizable set of options.
      
      def get_portfolios(params={}, options={}, user_access_token)
        default_params = {}
        default_options = {
          url: broker_endpoint,
          headers: {
            "Authorization" => "Bearer #{user_access_token}"
          }          
        }
        get("/portfolios", default_params.deep_merge(params), default_options.deep_merge(options))
      end

    end
  end
end

