require 'swanest/error'

module Swanest
  # Raised when Swanest returns the HTTP status code 500
  class Error::InternalServerError < Swanest::Error; end
end