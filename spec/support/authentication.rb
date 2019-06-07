require 'dotenv'
Dotenv.load

RSpec.configure do |config|
  config.before(:each, :authenticated) do
    Swanest.configure do |conf|
      conf.client_id = ENV['CLIENT_ID']
      conf.client_secret = ENV['CLIENT_SECRET']
    end
  end
end