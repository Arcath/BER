module Ber
  module Bignum
    ChunkSize = 0.size
    
    def to_ber
      "#{[Ber::Identifiers[:fixnum]].pack('C')}#{encoded_self}"
    end
    
    private
    
    def encoded_self
      ber_blocks = []
      i = self
      while i > 0
        block = i & 0xff
        ber_blocks.push block
        i = i >> ChunkSize
      end
      ([ber_blocks.size] + ber_blocks.reverse).pack('C*')
    end
  end
end

class Bignum
  include Ber::Bignum
end