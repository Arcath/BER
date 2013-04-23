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
  
  it "should be able to decode a number" do
    number = 15
    decoded = Ber.decode(number.to_ber)
    decoded[:identifier].should eq :fixnum
    decoded[:length].should eq 1
    decoded[:value].should eq number
    
    number = 258
    decoded = Ber.decode(number.to_ber)
    decoded[:identifier].should eq :fixnum
    decoded[:length].should eq 2
    decoded[:value].should eq number
  end
  
  it "should be able to decode a big num" do
    number = (2 ** 65)
    decoded = Ber.decode(number.to_ber)
    decoded[:identifier].should eq :fixnum
    decoded[:length].should eq 9
    decoded[:value].should eq number
  end
  
  it "should be able to decode a true value" do
    bool = true
    decoded = Ber.decode(bool.to_ber)
    decoded[:identifier].should eq :boolean
    decoded[:length].should eq 1
    decoded[:value].should eq bool
  end
  
  it "should be able to decode a false value" do
    bool = false
    decoded = Ber.decode(bool.to_ber)
    decoded[:identifier].should eq :boolean
    decoded[:length].should eq 1
    decoded[:value].should eq bool
  end
end