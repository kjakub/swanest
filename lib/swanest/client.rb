require 'swanest/api'

module Swanest
  class Client < API
    
    require 'swanest/client/broker'
    require 'swanest/client/identity'

    include Swanest::Client::Broker
    include Swanest::Client::Identity
  
  end
end