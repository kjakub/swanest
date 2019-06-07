require 'spec_helper'

RSpec.describe Swanest::Client::Identity, :authenticated,
  :vcr => { :cassette_name => 'identity', :record => :none } do

  let(:client) { Swanest::Client.new }

  it 'logins as app' do
    response = client.app_login
    expect(response).to have_key("access_token")
  end

end