require 'spec_helper'

RSpec.describe Swanest::Request do
  class DummyRequest; include Swanest::Request; end

  let(:dummy) { DummyRequest.new }
  let(:sample_path) { "/index" }
  let(:sample_params) { { :sample => "params" } }
  let(:sample_options) { { :sample => "options" } }

  describe "#get" do
    it "calls request with the passed params" do
      expect(dummy).to receive(:request).with(:get, sample_path, sample_params, sample_options).and_return("result")
      expect(dummy.get(sample_path, sample_params, sample_options)).to eql("result")
    end
  end

  describe "#post" do
    it "calls request with the passed params" do
      expect(dummy).to receive(:request).with(:post, sample_path, sample_params, sample_options).and_return("result")
      expect(dummy.post(sample_path, sample_params, sample_options)).to eql("result")
    end
  end

  describe "#delete" do
    it "calls request with the passed params" do
      expect(dummy).to receive(:request).with(:delete, sample_path, sample_params, sample_options).and_return("result")
      expect(dummy.delete(sample_path, sample_params, sample_options)).to eql("result")
    end
  end
end