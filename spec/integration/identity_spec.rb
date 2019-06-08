require 'spec_helper'

RSpec.describe Swanest::Client::Identity, :authenticated,
  :vcr => { :cassette_name => 'identity', :record => :none } do

  let(:client) { Swanest::Client.new }

  it 'app login' do
    response = client.app_login
    expect(response).to have_key("access_token")
  end

  it 'app login as user' do
    response = client.user_login({},{},"5ce69d3b68d67300083becfb")
    expect(response).to have_key("access_token")
  end


end