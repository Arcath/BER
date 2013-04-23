module Ber
  module Array
    def to_ber
      array = (self.ber? ? self : self.berable).join
      "#{[Ber::Identifiers[:array]].pack('C')}#{[array.length].pack('C')}#{array}"
    end
    
    def berable
      self.map { |x| x.to_ber }
    end
    
    def berable!
      self.map! { |x| x.to_ber }
    end
    
    def ber?
      ber = true
      self.each do |i|
        if ber
          if i.class == "".class
            ber = i.ber?
          else
            ber = false
          end
        end
      end
      return ber
    end
  end
end

class Array
  include Ber::Array
end