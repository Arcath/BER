require "ber/version"

require "ber/bignum"
require "ber/boolean"
require "ber/fixnum"
require "ber/string"

module Ber
  Zero = [0].pack('C')
  Identifiers = {
    end_of_content: 0,
    boolean: 1,
    fixnum: 2,
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
    if identifier == :fixnum
      if length == 1
        value = value.unpack('C').first
      else
        if value.length < 4
          padded_value = "#{Zero * (4 - value.length)}#{value}"
          value = padded_value.unpack('N').first
        else
          hex_total = ""
          value.split("").each do |char|
            hex = char.ord.to_s(16)
            hex_total << "0" if hex.length == 1
            hex_total << hex
          end
          value = hex_total.to_i(16)
        end
      end
    elsif identifier == :boolean
      value = (value == Zero ? false : true)
    end
    {identifier: identifier, length: length, value: value}
  end
end
