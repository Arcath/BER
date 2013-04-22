module Ber
  module Fixnum
    ChunkSize = 0.size
    
    def to_ber
      "#{[Ber::Identifiers[:fixnum]].pack('C')}#{encoded_self}"
    end
    
    private
    
    def encoded_self
      if self < (2 ** ChunkSize)
        code = [self].pack('C')
      else
        code32 = [self].pack('N')
        code = ""
        code32.split("").each do |char|
          code += char if char != [0].pack('C')
        end
      end
      [code.length].pack('C') + code
    end
  end
end

class Fixnum
  include Ber::Fixnum
end