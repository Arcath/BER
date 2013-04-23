module Ber
  module Boolean
    def to_ber
      "#{[Ber::Identifiers[:boolean]].pack('C')}#{encoded_self}"
    end
    
    private
    
    def encoded_self
      encoded = (self ? [1].pack('C') : [0].pack('C'))
      [1].pack('C') + encoded
    end
  end
end

class TrueClass
  include Ber::Boolean
end

class FalseClass
  include Ber::Boolean
end