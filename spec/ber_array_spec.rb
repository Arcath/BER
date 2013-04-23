require 'spec_helper'

describe Ber::Array do
  it "should make everything in the array \"berable\"" do
    a = ["foo", "bar"]
    a.berable.should eq ["foo".to_ber, "bar".to_ber]
    a.should eq ["foo", "bar"]
    a.berable!
    a.should eq ["foo".to_ber, "bar".to_ber]
  end
  
  it "should be able to check if it is ber" do
    ["foo", "bar"].ber?.should be_false
    ["foo".to_ber, "bar".to_ber].ber?.should be_true
    ["foo".to_ber, "bar"].ber?.should be_false
  end
  
  it "should be able to convert into ber" do
    ["foo", "bar"].to_ber.should eq "0\n\x04\x03foo\x04\x03bar"
  end
end