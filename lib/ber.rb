require "ber/version"

require "ber/string"

module Ber
  Identifiers = {
    end_of_content: 0,
    boolean: 1,
    integer: 2,
    bit_string: 3,
    ocet_string: 4,
    null: 5,
    
    # Quick shorthands
    string: 4
  }
  
  def self.decode(input)
    idents = Identifiers.select { |key, value| value == input.getbyte(0) }
    identifier = idents.first.first
    length = input.getbyte(1)
    if length >= 127
      length = input.length - (length - 126)
    end
    value = input[(input.length - length)..input.length]
    {identifier: identifier, length: length, value: value}
  end
end
