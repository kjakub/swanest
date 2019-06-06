require "swanest/version"
require 'swanest/configuration'
require 'swanest/client'

module Swanest
  extend Configuration

  class << self
    # Alias for Swanest::Client.new
    #
    # @return [Swanest::Client]
    def new(options={})
      Swanest::Client.new(options)
    end

    # Delegate to Swanest::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end

  end
  
end
