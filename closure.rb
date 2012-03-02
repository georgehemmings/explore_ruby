require "bigdecimal"

class String
  def convert(convertor)
    convertor.call self
  end
end

class CurrencyConvertor
  attr_accessor :usd_to_gbp_exchange_rate
  
  def from_usd_to_gbp
    lambda do |usd_string|
      usd = BigDecimal.new(usd_string)
      gbp = usd * usd_to_gbp_exchange_rate
      "%.2f" % gbp
    end
  end
end

cc = CurrencyConvertor.new
cc.usd_to_gbp_exchange_rate = BigDecimal("1.2")  # Set rate
from_usd_to_gbp = cc.from_usd_to_gbp             # Create convertor
cc.usd_to_gbp_exchange_rate = BigDecimal("2.0")  # Change rate
cc = nil

puts "500.00".convert from_usd_to_gbp            # => "1000.00"
