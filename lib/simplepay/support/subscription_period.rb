require 'simplepay/support/interval'

module Simplepay
  module Support
    
    class SubscriptionPeriod < Interval
      ALLOWED_INTERVALS       = Simplepay::Intervals + ['forever']
      
      # Limited to 3 digits.
      ALLOWED_QUANTITY_RANGE  = (1...1000)
      
      ##
      # See Simplepay::Support::Interval.to_s for more information.
      # 
      # If the subscription lasts "forever" then Amazon does not need an
      # interval string.
      # 
      def to_s
        super unless interval == 'forever'
      end
      
    end
    
  end
end