require 'spec_helper'

RSpec.describe Swanest::Client::Broker do
  let(:client) { Swanest::Client.new }
  let(:user_access_token) { "user_access_token" }

  describe '#get_portfolios' do
    it 'get /portfolios' do
      params = { some: "params" }
      options = { some: "options" }

      merged_params = {
        some: "params"
      }

      merged_options = {
        url: client.broker_endpoint,
        headers: {
          "Authorization" => "Bearer #{user_access_token}"
        },
        some: "options"        
      }
      expect(client).to receive(:get).with('/portfolios', merged_params, merged_options).and_return('success')
      expect(client.get_portfolios(params, options, user_access_token)).to eql('success')
    end
  end

end