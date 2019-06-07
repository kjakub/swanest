require 'spec_helper'

RSpec.describe Swanest::Client::Broker do
  let(:client) { Swanest::Client.new }

  describe '#get_portfolios', skip: true do
    it 'get /portfolios' do
      params = { :some => "params" }
      options = { :some => "options" }
      expect(client).to receive(:get).with('/portfolios', params, options).and_return('success')
      expect(client.get_portfolios(params,options)).to eql('success')
    end
  end

end