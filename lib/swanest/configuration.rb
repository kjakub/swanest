module Swanest
	module Configuration

    # The client id if none is set
    DEFAULT_CLIENT_ID = nil

    # The client secret if none is set
    DEFAULT_CLIENT_SECRET = nil

    # The indentity endpoint that will be used to connect if none is set
    DEFAULT_IDENTITY_ENDPOINT = "https://identity.ci.swanest.com"

    # The broker endpoint that will be used to connect if none is set
    DEFAULT_BROKER_ENDPOINT = "https://broker.ci.swanest.com"

    # The value sent in the 'User-Agent' header if none is set
    DEFAULT_USER_AGENT = "Swanest Ruby Gem #{Swanest::VERSION}"

    # The Faraday connection options if none are set
    DEFAULT_CONNECTION_OPTIONS = {}

    # The HTTP connection adapter that will be used to connect if none is set
    DEFAULT_ADAPTER = :net_http


		VALID_OPTIONS_KEYS = [
      :client_id,
      :client_secret,
      :identity_endpoint,
      :broker_endpoint,
      :user_agent,
      :connection_options,
      :adapter     
    ]

    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k)}
      options
    end

    # Reset all configuration options to defaults
    def reset
      self.client_id          = DEFAULT_CLIENT_ID
      self.client_secret      = DEFAULT_CLIENT_SECRET
      self.identity_endpoint  = DEFAULT_IDENTITY_ENDPOINT
      self.broker_endpoint    = DEFAULT_BROKER_ENDPOINT
      self.user_agent         = DEFAULT_USER_AGENT
      self.connection_options = DEFAULT_CONNECTION_OPTIONS
      self.adapter            = DEFAULT_ADAPTER
      self
    end

	end

end