require "ber/version"

require "ber/array"
require "ber/bignum"
require "ber/boolean"
require "ber/fixnum"
require "ber/string"

module Ber
  Zero = [0].pack('C')
  Identifiers = {
    end_of_content: 0x0,
    boolean: 0x1,
    fixnum: 0x2,
    bit_string: 0x3,
    ocet_string: 0x4,
    null: 0x5,
    array: 0x30,
    
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
    elsif identifier == :array 
      values = []
      found = value.scan(/(..[A-z]*)/) # This WILL NOT work for Bignums or strings of over 127 in length TODO: Fix this
      found.each do |v|
        values << Ber.decode(v.first)[:value]
      end
      value = values
    end
    {identifier: identifier, length: length, value: value}
  end
end
