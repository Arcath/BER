require 'spec_helper'

describe Ber::String do
  it "should extend String" do
    "foo".to_ber
  end
  
  it "should ber encode a string" do
    "foo".to_ber.should eq "\x04\x03foo"
  end
  
  it "should be able to tell if a string is a ber string" do
    "foo".ber?.should be_false
    "foo".to_ber.ber?.should be_true
  end
  
  #it "should encode a longer string" do
  #  long_string.to_ber.should eq "\x04\x82\x02X#{long_string}"
  #end
end