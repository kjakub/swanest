require 'spec_helper'

RSpec.describe Swanest::Client::Broker, :authenticated,
  :vcr => { :cassette_name => 'broker', :record => :none } do

  let(:client) { Swanest::Client.new }
  let(:portfolio_attributes) { 
  	{ isLive: false, name: "this is my portfolio", config: { currency: "EUR", targetRiskNumber: 1, timeHorizon: { years: 3 }, createdAt: "2019-05-23T14:42:02.523Z" } }
  }
  let(:user_access_token) { "<user_access_token>" }
  
  it 'creates portfolio for user', :vcr => { :cassette_name => 'broker', :record => :none } do
  	response = client.create_portfolio(portfolio_attributes, {}, user_access_token)
    expect(response).to have_key("portfolioId")
  end

  it 'gets portfolios for user' do
    response = client.get_portfolios({}, {}, user_access_token)
    expect(response).to have_key("portfolios")
  end


end