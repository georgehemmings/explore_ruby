require "bigdecimal"

class String
  def convert(convertor)
    convertor.call self
  end
end

from_inches_to_cms = lambda do |inches_string|
  conversion_factor = BigDecimal.new("2.25")
  cms = BigDecimal.new(inches_string) * conversion_factor
  "%.2f" % cms
end

puts "100".convert from_inches_to_cms  # => "225.00"
