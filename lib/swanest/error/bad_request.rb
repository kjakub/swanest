require 'swanest/error'

module Swanest
  # Raised when Swanest returns the HTTP status code 400
  class Error::BadRequest < Swanest::Error; end
end