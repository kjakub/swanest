require 'spec_helper'

RSpec.describe Swanest::Error do

  describe '#new' do
    specify 'message parameter can be nil' do
      expect { Swanest::Error.new(nil, :header => 'data') }.to_not raise_error
    end

    it 'builds an error with the given message' do
      error = Swanest::Error.new('bad data', :header => 'data')
      expect( error.message).to eql('bad data')
    end

    it 'sets http_headers attribute' do
      error = Swanest::Error.new('some message', :some => 'value')
      expect(error.http_headers).to eql({ :some => 'value' })
    end
  end

end

