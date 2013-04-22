module Ber
  module String
    def to_ber(identifier = :string)
      "#{[Ber::Identifiers[identifier]].pack('C')}#{encoded_length}#{self}"
    end
  
    private
  
    def encoded_length
      if length <= 127
        [length].pack('C')
      else
        i = [length].pack('N').sub(/^[\0]+/,"")
        [0x80 + i.length].pack('C') + i
      end
    end
  end
end

class String
  include Ber::String
end