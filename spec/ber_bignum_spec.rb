require 'spec_helper'

describe Ber::Bignum do
  it "should encode a bignum" do
    (2 ** 64).class.should be Bignum
    (2 ** 64).to_ber.should eq "\u0002\t\u0001\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000"
  end
end