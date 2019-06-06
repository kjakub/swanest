#require 'swanest/authentication'
require 'swanest/configuration'
require 'swanest/connection'
require 'swanest/request'

module Swanest
  class API
    # include Authentication
    include Connection
    include Request

    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # Creates a new API
    def initialize(options={})
      options = Swanest.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
  end
end