require 'spec_helper'

describe Ber do
  it "should have a version" do
    Ber::VERSION.should be_a String
  end
  
  it "should have a hash of identifiers" do
    Ber::Identifiers.should be_a Hash
  end
  
  it "should be able to decode a string" do
    string = "foo".to_ber
    decoded = Ber.decode(string)
    decoded.should be_a Hash
    decoded[:identifier].should eq :ocet_string
    decoded[:length].should eq 3
    decoded[:value].should eq "foo"
  end
  
  it "should be able to decode a long_string" do
    string = long_string.to_ber
    decoded = Ber.decode(string)
    decoded.should be_a Hash
    decoded[:identifier].should eq :ocet_string
    decoded[:length].should eq long_string.length
    decoded[:value].should eq long_string
    
    string = long_string(200).to_ber
    decoded = Ber.decode(string)
    decoded.should be_a Hash
    decoded[:identifier].should eq :ocet_string
    decoded[:length].should eq long_string(200).length
    decoded[:value].should eq long_string(200)
  end
end