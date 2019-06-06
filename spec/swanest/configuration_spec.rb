require 'spec_helper'

RSpec.describe Swanest::Configuration do
  class ExtendedClass; extend  Swanest::Configuration; end
  class IncludedClass; include Swanest::Configuration; end

  describe "#extended" do
    it "has all configuration variables set to the default values by default" do
      Swanest::Configuration::VALID_OPTIONS_KEYS.each do |key|
        expect(ExtendedClass.send(key)).to eql(Swanest::Configuration.const_get("DEFAULT_#{key.to_s.upcase}"))
      end
    end
  end

  describe "#configure" do
    it "allows configuration variables to be set in a block" do
      object = IncludedClass.new
      object.configure do |o|
        o.client_id = "my client_id"
      end
      expect(object.client_id).to eql("my client_id")
    end
  end

  describe "#options" do
    it "returns a hash of all configuration options" do
      object = IncludedClass.new
      config = { :client_id => "123-client_id" }
      config.each { |k,v| object.send("#{k.to_s}=", v) }
      config.each { |k,v| expect(object.options[k]).to eql(v) }
    end
  end

  describe "#reset" do
    it "sets all config variables to the defaults" do
      object = IncludedClass.new
      Swanest::Configuration::VALID_OPTIONS_KEYS.each_with_index do |key, i|
        object.send("#{key}=", i)
        expect(object.send(key)).to eql(i)
      end

      object.reset

      Swanest::Configuration::VALID_OPTIONS_KEYS.each do |key|
        expect(object.send(key)).to eql(Swanest::Configuration.const_get("DEFAULT_#{key.to_s.upcase}"))
      end
    end
  end
end
