require 'spec_helper'

describe Ber::Fixnum do
  it "should have a Chunk Size defined" do
    Ber::Fixnum::ChunkSize.should be_a Fixnum
  end
  
  it "should extend fixnum with to_ber" do
    10.to_ber
  end
  
  it "should encode a small number (less than #{Ber::Fixnum::ChunkSize} bits long (less than #{(2 ** Ber::Fixnum::ChunkSize) - 1}))" do
    15.to_ber.should eq "\u0002\u0001\u000F"
  end
  
  it "should encode a large number (more than #{Ber::Fixnum::ChunkSize} bits long (more than #{(2 ** Ber::Fixnum::ChunkSize)}))" do
    257.to_ber.should eq "\u0002\u0002\u0001\u0001"
  end
end