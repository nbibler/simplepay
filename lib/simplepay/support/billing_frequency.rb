require 'simplepay/support/interval'

module Simplepay
  module Support
    
    class BillingFrequency < Interval
      ALLOWED_INTERVALS       = Simplepay::Intervals
      
      # Limited to 2 digits.
      ALLOWED_QUANTITY_RANGE  = (1...100)
    end
    
  end
end