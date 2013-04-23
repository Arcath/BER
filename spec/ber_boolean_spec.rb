require 'spec_helper'

describe Ber::Boolean do
  it "should encode a true value" do
    true.to_ber.should eq "\001\001\001"
  end
  
  it "should encode a false value" do
    false.to_ber.should eq "\001\001\000"
  end
end