require 'simplepay/errors'
require 'simplepay/support/currency'

module Simplepay
  
  module Boolean
    True  = '1'
    False = '0'
  end
  
  module Interval
    Day   = 'day'
    Week  = 'week'
    Month = 'month'
    Year  = 'year'
  end
  
  Intervals = [Interval::Day, Interval::Week, Interval::Month, Interval::Year]
  
  module Currency
    USD   = Support::Currency.new('United States Dollar', 'USD', "%0.2f")
  end
  
  Currencies = [Currency::USD]
  
end