module Swanest
  class Client
    # Defines methods related to URLs
    module Identity

      # Returns access token for app with scope to create users
      #
      # @requires_authentication Yes
      #
      # @param options [Hash] A customizable set of options.
      
      def app_login(params={}, options={})
        default_params = {
          :client_id => client_id,
          :client_secret => client_secret,
          :grant_type => "client_credentials",
          :scope => "identity:create"
        }
        default_options = {
          url: identity_endpoint
        }

        debugger

        post("/oauth/token", default_params.deep_merge(params), default_options.deep_merge(options))
      end

      # Returns access token for user with broker,profile,makrket_data read 
      #
      # @requires_authentication Yes
      #
      # @param options [Hash] A customizable set of options.

      def user_login(params={}, options={}, user_id)
        default_params = {
          :client_id => client_id,
          :client_secret => client_secret,
          :grant_type => "client_credentials",
          :scope => "broker:write broker:read profile market_data:read",
          :user_id => user_id
        }
        default_options = {
          url: identity_endpoint
        }
        post("/oauth/token", default_params.deep_merge(params), default_options.deep_merge(options))
      end
      
      # Returns a hash with userId created {"userId"=>""}
      #
      # @requires_authentication access_token from app_login
      #
      # @param options [Hash] A customizable set of options.

      def create_user(params={}, options={}, access_token=nil)

        access_token = access_token || app_login["access_token"]

        default_params = {
          :country => 'BE',
          :language => 'en',
          :partnerId => params.fetch(:partnerId),
          :primaryCurrency => 'EUR'
        }
        default_options = {
          :url => identity_endpoint,
          :headers => {
            "Authorization" => "Bearer #{access_token}"
          },
        }
        post("/users/shared", default_params.deep_merge(params), default_options.deep_merge(options))
      end

    end
  end
end