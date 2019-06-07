require 'spec_helper'

RSpec.describe Swanest::Client::Identity do
  let(:client) { Swanest::Client.new }

  describe '#app_login' do
    it 'post /oauth/token', skip: true do
      params = { :some => "params" }
      options = { :some => "options" }
      expect(client).to receive(:post).with('/oauth/token', params, options).and_return('success')
      expect(client.app_login(params,options)).to eql('success')
    end
  end

end
