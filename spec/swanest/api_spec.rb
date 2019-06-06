require 'spec_helper'

RSpec.describe Swanest::API do

  describe "#initialize" do
    context "without passing new options" do
      it "uses the default options" do
        api = Swanest::API.new
        Swanest::Configuration::VALID_OPTIONS_KEYS.each do |valid_key|
          expect(api.send(valid_key)).to eql(Swanest.options[valid_key])
        end
      end
    end

    context "while passing custom options" do
      it "uses the new options" do
        key_to_overwrite = Swanest.options.keys.first
        overwrite_value  = "NEW VALUE!!"

        api = Swanest::API.new(key_to_overwrite => overwrite_value)
        Swanest::Configuration::VALID_OPTIONS_KEYS.each do |valid_key|
          expected_value = valid_key == key_to_overwrite ? overwrite_value : Swanest.options[valid_key]
          expect(api.send(valid_key)).to eql(expected_value)
        end
      end
    end
  end

  describe "configuration" do
    let(:api) { Swanest::API.new }

    Swanest::Configuration::VALID_OPTIONS_KEYS.each do |config_key|
      it "allows the value of #{config_key} to be set" do
        expect { api.send("#{config_key}=", "SOME NEW VALUE") }.to_not raise_error
        expect(api.send(config_key)).to eql("SOME NEW VALUE")
      end
    end
  end
end
