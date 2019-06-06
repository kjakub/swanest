RSpec.describe Swanest do
  
  it "has a version number" do
    expect(Swanest::VERSION).not_to be nil
  end

  describe ".new" do
    it "is an alias for Swanest::Client.new" do
      options = { :some => "option" }
      expect(Swanest.new(options).class.name).to eql("Swanest::Client")
    end
  end

  describe ".method_missing" do
    context "with a method known to Swanest::Client" do
      it "passes the method call to Swanest::Client" do

      	expected_result = {:some => "result"}
      	allow_any_instance_of(Swanest::Client).to receive(:get_portfolios).and_return(expected_result)

        expect(Swanest.get_portfolios(:option1 => 'value')).to eql(expected_result)
        expect{Swanest.get_portfolios(:option1 => 'value')}.to_not raise_error
          
      end
    end

    context "with a method unknown to Swanest::Client" do
      it "raises method not found error" do
        expect { Swanest.some_unknown_method }.to raise_error(NoMethodError)
      end
    end
  end

  describe ".respond_to?" do
    it "returns true if Swanest::Client responds to the method" do
      expect(Swanest.respond_to?(:get_portfolios)).to be true
    end

    it "returns false if Swanest::Client does not respond to the method" do
      expect(Swanest.respond_to?(:some_unknown_method)).to be false
    end
  end



end
